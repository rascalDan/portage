EAPI="7"
PYTHON_COMPAT=( python3_{4,5,6} )
inherit multilib python-single-r1 cmake-utils vim-plugin

youcompletemev="25ebc0b9abb1b135c809ee850085a0305cbc5533"
ycmdv="4dfa50eb5873c071b446f25b17cbad066164b339"
reqfuv="98712e7d0f6be2a090b6fda2a925f85e63656b58"
pfdv="b27053e4d11f5891319fd29eda561c130ba3112a"
ossv="e1902915c6790bcec00b8d551199c8a3537d33c9"
gocodev="416643789f088aa5077f667cecde7f966131f6be"

KEYWORDS="amd64 x86"
SRC_URI="
	https://github.com/Valloric/YouCompleteMe/archive/$youcompletemev.tar.gz -> youcompleteme-$youcompletemev.tar.gz
	https://github.com/Valloric/ycmd/archive/$ycmdv.tar.gz -> ycmd-$ycmdv.tar.gz
	https://github.com/ross/requests-futures/archive/$reqfuv.tar.gz -> requests-futures-$reqfuv.tar.gz
	https://github.com/slezica/python-frozendict/archive/$pfdv.tar.gz -> python-frozendict-$pfdv.tar.gz
	csharp? ( https://github.com/OmniSharp/omnisharp-server/archive/$ossv.tar.gz -> omnisharp-server-$ossv.tar.gz )
	go? ( https://github.com/nsf/gocode/archive/$gocodev.tar.gz -> gocode-$gocodev.tar.gz )
"

DESCRIPTION="vim plugin: a code-completion engine for Vim"
HOMEPAGE="http://valloric.github.io/YouCompleteMe/"

LICENSE="GPL-3"
IUSE="+clang test go csharp"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="
	${PYTHON_DEPS}
	clang? ( sys-devel/clang:8 )
	>=dev-libs/boost-1.65:=[python,threads,${PYTHON_USEDEP}]
	|| (
		app-editors/vim[python,${PYTHON_USEDEP}]
		app-editors/gvim[python,${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${COMMON_DEPEND}
	dev-python/bottle[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/jedi[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/sh[${PYTHON_USEDEP}]
	dev-python/waitress[${PYTHON_USEDEP}]
"
DEPEND="
	${COMMON_DEPEND}
	test? (
		>=dev-python/mock-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/nose-1.3.0[${PYTHON_USEDEP}]
		dev-cpp/gmock
		dev-cpp/gtest
	)
"

S="${WORKDIR}/YouCompleteMe-$youcompletemev"
CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/third_party/ycmd/cpp

VIM_PLUGIN_HELPFILES="${PN}"

src_prepare() {
	for third_party_module in ycmd pythonfutures requests-futures; do
		rm -r "${S}"/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	mv ${WORKDIR}/ycmd-$ycmdv ${S}/third_party/ycmd
	use csharp && mv ${WORKDIR}/omnisharp-server-$ossv ${S}/third_party/ycmd/third_party/omnisharp-server
	rmdir ${S}/third_party/ycmd/third_party/frozendict
	mv ${WORKDIR}/python-frozendict-$pfdv ${S}/third_party/ycmd/third_party/frozendict
	use go && mv ${WORKDIR}/gocode-$gocodev ${S}/third_party/ycmd/third_party/gocode
	mv ${WORKDIR}/requests-futures-$reqfuv ${S}/third_party/requests-futures
	cmake-utils_src_prepare
	default
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CLANG_COMPLETER=$(usex clang)
		-DUSE_SYSTEM_LIBCLANG=$(usex clang)
		-DUSE_PYTHON2=OFF
		-DPATH_TO_LLVM_ROOT=/usr/lib/llvm/8
		-DUSE_SYSTEM_BOOST=ON
	)
	cmake-utils_src_configure
}

src_test() {
	cd "${S}/third_party/ycmd/cpp/ycm/tests"
	LD_LIBRARY_PATH="${EROOT}"/usr/$(get_libdir)/llvm \
		./ycm_core_tests || die

	cd "${S}"/python/ycm

	local dirs=( "${S}"/third_party/*/ "${S}"/third_party/ycmd/third_party/*/ )
	local -x PYTHONPATH=${PYTHONPATH}:$(IFS=:; echo "${dirs[*]}")

	nosetests || die
}

src_install() {
	dodoc *.md third_party/ycmd/*.md
	rm -r *.md *.sh COPYING.txt third_party/ycmd/cpp || die
	rm -r third_party/ycmd/{*.md,*.sh} || die
	find python third_party/ycmd -depth -name '*test*' -exec rm -r {} + || die
	find python third_party/ycmd -depth -name '*examples*' -exec rm -r {} + || die
	rm third_party/ycmd/third_party/clang/lib/libclang.so.* || die

	vim-plugin_src_install

	python_optimize "${ED}"
	python_fix_shebang "${ED}"
}
