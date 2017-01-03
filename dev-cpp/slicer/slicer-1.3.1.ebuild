EAPI="5"

DESCRIPTION="Zeroc ICE helper to create generic serialization code for slice types"
HOMEPAGE="http://slicer.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0/9"
KEYWORDS="x86 amd64"
IUSE="db xml json"

RDEPEND="dev-libs/Ice
	xml? ( =dev-cpp/libxmlpp-2.40* )
	json? ( dev-cpp/libjsonpp )
	db? ( =dev-libs/libdbpp-1*:= )
	>=dev-libs/libadhocutil-0.3:=
	dev-libs/boost"
DEPEND="${RDEPEND}
	dev-util/boost-build"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/slicer || die
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release -q \
			$(use xml && echo xml//slicer-xml) \
			$(use json && echo json//slicer-json) \
			$(use db && echo db//slicer-db) \
			slicer tool || die
}

src_install() {
	cd ${S}/slicer || die
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release install -q \
			$(use xml && echo install-xml) \
			$(use json && echo install-json) \
			$(use db && echo install-db) \
			--bindir=${D}/usr/bin --libdir=${D}/usr/lib --includedir=${D}/usr/include/slicer || die
}

