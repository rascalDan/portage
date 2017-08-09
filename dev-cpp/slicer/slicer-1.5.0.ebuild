EAPI="5"

inherit bjam

DESCRIPTION="Zeroc ICE helper to create generic serialization code for slice types"
HOMEPAGE="http://slicer.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/1.5.0"
KEYWORDS="x86 amd64"
IUSE="db xml json"

RDEPEND="dev-libs/Ice
	xml? ( dev-cpp/libxmlpp:3.0 )
	json? ( dev-cpp/libjsonpp )
	db? ( =dev-libs/libdbpp-1*:= )
	>=dev-libs/libadhocutil-0.4.1:=
	dev-libs/boost"
DEPEND="${RDEPEND}
	dev-util/boost-build"

src_compile() {
	bjambuild \
			$(use xml && echo slicer/xml//slicer-xml) \
			$(use json && echo slicer/json//slicer-json) \
			$(use db && echo slicer/db//slicer-db) \
			slicer/slicer//slicer slicer/tool//slicer slicer/ice//slicer-ice || die
}

src_install() {
	bjambuild slicer//install \
			$(use xml && echo slicer//install-xml) \
			$(use json && echo slicer//install-json) \
			$(use db && echo slicer//install-db) \
			--prefix=${D}/usr || die
}

