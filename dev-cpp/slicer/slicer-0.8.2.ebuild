EAPI="5"

DESCRIPTION="Zeroc ICE helper to create generic serialization code for slice types"
HOMEPAGE="http://slicer.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0/3"
KEYWORDS="x86 amd64"
IUSE="xml json"

DEPEND="dev-libs/Ice
	xml? ( dev-cpp/libxmlpp )
	json? ( dev-cpp/libjsonpp )
	dev-libs/boost
	dev-util/boost-build"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/slicer || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release -q slicer tool || die
	use xml && (setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release -q xml || die)
	use json && (setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release -q json || die)
}

src_install() {
	cd ${S}/slicer || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install -q --bindir=${D}/usr/bin --libdir=${D}/usr/lib --includedir=${D}/usr/include/slicer || die
	use xml && (setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install-xml -q --bindir=${D}/usr/bin --libdir=${D}/usr/lib --includedir=${D}/usr/include/slicer || die)
	use json && (setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install-json -q --bindir=${D}/usr/bin --libdir=${D}/usr/lib --includedir=${D}/usr/include/slicer || die)
}
