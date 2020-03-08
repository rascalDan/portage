EAPI="7"
PYTHON_COMPAT=( python3_{4,5,6,7,8} )
inherit multilib python-single-r1 cmake-utils vim-plugin

youcompletemev="124661f218e80b96c1f9f3d124e99f9a2fd2d83b"
ycmdv="d3378ca3a3103535c14b104cb916dcbcdaf93eeb"
reqfuv="148451a06781d8196e5fb7e0e2bca7a765368ff1"
ossv="e1902915c6790bcec00b8d551199c8a3537d33c9"
gocodev="5bee97b488366fd20b054d0861b89834ff5bbfb2"

KEYWORDS="~amd64 ~x86"
SRC_URI="
	https://github.com/Valloric/YouCompleteMe/archive/$youcompletemev.tar.gz -> youcompleteme-$youcompletemev.tar.gz
	https://github.com/Valloric/ycmd/archive/$ycmdv.tar.gz -> ycmd-$ycmdv.tar.gz
	https://github.com/ross/requests-futures/archive/$reqfuv.tar.gz -> requests-futures-$reqfuv.tar.gz
	csharp? ( https://github.com/OmniSharp/omnisharp-server/archive/$ossv.tar.gz -> omnisharp-server-$ossv.tar.gz )
	go? ( https://github.com/nsf/gocode/archive/$gocodev.tar.gz -> gocode-$gocodev.tar.gz )
"

DESCRIPTION="vim plugin: a code-completion engine for Vim"
HOMEPAGE="http://valloric.github.io/YouCompleteMe/"

LICENSE="GPL-3"
IUSE="+clang test go csharp"
#REQUIRED_USE="${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="
	${PYTHON_DEPS}
	clang? ( sys-devel/clang:9 )
	$(python_gen_cond_dep '
			>=dev-libs/boost-1.65:=[python,threads,${PYTHON_MULTI_USEDEP}]
			|| (
				app-editors/vim[python,${PYTHON_SINGLE_USEDEP}]
				app-editors/gvim[python,${PYTHON_SINGLE_USEDEP}]
			   )
	')
"
RDEPEND="
	${COMMON_DEPEND}
	$(python_gen_cond_dep '
			dev-python/bottle[${PYTHON_MULTI_USEDEP}]
			dev-python/future[${PYTHON_MULTI_USEDEP}]
			dev-python/jedi[${PYTHON_MULTI_USEDEP}]
			dev-python/requests[${PYTHON_MULTI_USEDEP}]
			dev-python/sh[${PYTHON_MULTI_USEDEP}]
			dev-python/waitress[${PYTHON_MULTI_USEDEP}]
	')
"
DEPEND="
	${COMMON_DEPEND}
	test? (
			$(python_gen_cond_dep '
				>=dev-python/mock-1.0.1[${PYTHON_MULTI_USEDEP}]
				>=dev-python/nose-1.3.0[${PYTHON_MULTI_USEDEP}]
				dev-cpp/gmock
				dev-cpp/gtest
			')
	)
"

S="${WORKDIR}/YouCompleteMe-$youcompletemev"
CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/third_party/ycmd/cpp

VIM_PLUGIN_HELPFILES="${PN}"

src_prepare() {
	echo $RDEPEND
		echo $DEPEND

	eapply ${FILESDIR}/remove-python2-support.patch
	for third_party_module in ycmd requests-futures; do
		rm -r "${S}"/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	mv ${WORKDIR}/ycmd-$ycmdv ${S}/third_party/ycmd
	use csharp && mv ${WORKDIR}/omnisharp-server-$ossv ${S}/third_party/ycmd/third_party/omnisharp-server
	use go && mv ${WORKDIR}/gocode-$gocodev ${S}/third_party/ycmd/third_party/gocode
	mv ${WORKDIR}/requests-futures-$reqfuv ${S}/third_party/requests-futures
	cmake-utils_src_prepare
	default
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CLANG_COMPLETER=$(usex clang)
		-DUSE_SYSTEM_LIBCLANG=$(usex clang)
		-DPATH_TO_LLVM_ROOT=/usr/lib/llvm/9
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
