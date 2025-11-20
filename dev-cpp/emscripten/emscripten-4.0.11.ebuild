EAPI=8

DESCRIPTION="Emscripten compiles C and C++ to WebAssembly using LLVM and Binaryen."
HOMEPAGE="https://emscripten.org"
SRC_URI="https://github.com/emscripten-core/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="${PV}"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
net-libs/nodejs
=dev-util/binaryen-123*
llvm-core/clang:21"
BDEPEND=""

src_compile()
{
	true
}

src_install()
{
	DESTDIR="${D}/usr/$(get_libdir)/${PN}/${SLOT}"
	mkdir -p ${DESTDIR}
	python -c "import tools.install; tools.install.copy_emscripten(\"${DESTDIR}\")" || die
	"${DESTDIR}/emcc" --generate-config
	echo "import os" >> ${DESTDIR}/.emscripten
	echo "CACHE = os.path.expanduser(os.path.join('~', '.cache', '${PN}', '${SLOT}'))" >> ${DESTDIR}/.emscripten
}
