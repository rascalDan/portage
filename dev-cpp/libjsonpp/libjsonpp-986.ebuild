EAPI="3"

DESCRIPTION="Lightweight native C++ JSON library"
HOMEPAGE="http://libjsonpp.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-cpp/glibmm
	dev-libs/boost
	dev-util/boost-build"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/libjsonpp || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release -q || die
}

src_install() {
	cd ${S}/libjsonpp || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install -q --libdir=${D}/usr/lib --includedir=${D}/usr/include || die
}
