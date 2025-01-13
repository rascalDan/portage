EAPI="8"
PYTHON_COMPAT=( python3_{10,11,12} )
inherit llvm multilib python-single-r1 cmake vim-plugin

youcompletemev="63ab13e95141c252c545f9a6c7144ced6790d68f"
ycmdv="8b61f198f9c824ce3ef246e5fd542a2304c9275e"

KEYWORDS="amd64 ~x86"
SRC_URI="
	https://github.com/ycm-core/YouCompleteMe/archive/$youcompletemev.tar.gz -> youcompleteme-$youcompletemev.tar.gz
	https://github.com/ycm-core/ycmd/archive/$ycmdv.tar.gz -> ycmd-$ycmdv.tar.gz
"

DESCRIPTION="vim plugin: a code-completion engine for Vim"
HOMEPAGE="http://ycm-core.github.io/YouCompleteMe/"

LICENSE="GPL-3"
IUSE="+clang"

COMMON_DEPEND="
	${PYTHON_DEPS}
	dev-cpp/abseil-cpp:=
	clang? ( llvm-core/clang:= )
	$(python_gen_cond_dep '
			>=dev-libs/boost-1.65:=[python,${PYTHON_USEDEP}]
			|| (
				app-editors/vim[python,${PYTHON_SINGLE_USEDEP}]
				app-editors/gvim[python,${PYTHON_SINGLE_USEDEP}]
			   )
	')
"
RDEPEND="
	${COMMON_DEPEND}
	$(python_gen_cond_dep '
			>=dev-python/bottle-0.12.18[${PYTHON_USEDEP}]
			>=dev-python/regex-2020.2.20[${PYTHON_USEDEP}]
			>=dev-python/jedi-0.16.0[${PYTHON_USEDEP}]
			>=dev-python/watchdog-0.10.2[${PYTHON_USEDEP}]
	')
"
DEPEND="
	${COMMON_DEPEND}
"

S="${WORKDIR}/YouCompleteMe-$youcompletemev"
CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/third_party/ycmd/cpp

VIM_PLUGIN_HELPFILES="${PN}"

src_prepare() {
	for third_party_module in ycmd ; do
		rm -r "${S}"/third_party/${third_party_module} || die "Failed to remove third party module ${third_party_module}"
	done
	mv ${WORKDIR}/ycmd-$ycmdv ${S}/third_party/ycmd
	cmake_src_prepare
	default
}

src_configure() {
	local mycmakeargs=(
		-DUSE_CLANG_COMPLETER=$(usex clang)
		-DUSE_SYSTEM_LIBCLANG=$(usex clang)
		-DPATH_TO_LLVM_ROOT=$(get_llvm_prefix)
		-DUSE_SYSTEM_ABSEIL=ON
		-DPython3_LIBRARY=$SYSROOT/usr/$(get_libdir)/lib$EPYTHON.so
		-DPython3_EXECUTABLE=$SYSROOT/usr/bin/$EPYTHON
		-DPython3_INCLUDE_DIR=$SYSROOT/usr/include/$EPYTHON
	)
	cmake_src_configure
}

src_install() {
	dodoc *.md third_party/ycmd/*.md
	rm -r *.md *.sh COPYING.txt third_party/ycmd/cpp || die
	rm -r third_party/ycmd/{*.md,*.sh} || die
	rm -r test || die
	find python third_party/ycmd -depth -name '*test*' -exec rm -r {} + || die
	find python third_party/ycmd -depth -name '*examples*' -exec rm -r {} + || die

	vim-plugin_src_install third_party python

	python_optimize "${ED}"
	python_fix_shebang "${ED}"
}
