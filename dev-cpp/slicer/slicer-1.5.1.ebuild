EAPI="5"

inherit bjam

DESCRIPTION="Zeroc ICE helper to create generic serialization code for slice types"
HOMEPAGE="http://slicer.randomdan.homeip.net/"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0/1.5.0"
KEYWORDS="x86 amd64"
IUSE="db xml json"

RDEPEND="=dev-libs/Ice-3.6*
	xml? ( dev-cpp/libxmlpp:3.0 )
	json? ( <dev-cpp/libjsonpp-0.10 )
	db? ( =dev-libs/libdbpp-1*:= )
	>=dev-libs/libadhocutil-0.4.1:=
	dev-libs/boost:="
DEPEND="${RDEPEND}
	dev-util/boost-build"

src_compile() {
	bjambuild \
		$(use xml && echo slicer/xml//slicer-xml) \
		$(use json && echo slicer/json//slicer-json) \
		$(use db && echo slicer/db//slicer-db) \
		slicer/slicer//slicer slicer/tool//slicer slicer/ice//slicer-ice
}

src_install() {
	bjaminstall slicer//install \
		$(use xml && echo slicer//install-xml) \
		$(use json && echo slicer//install-json) \
		$(use db && echo slicer//install-db) \
		-i ""
}

