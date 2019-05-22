EAPI="5"

inherit bjam

DESCRIPTION="Zeroc ICE helper to create generic serialization code for slice types"
HOMEPAGE="http://slicer.randomdan.homeip.net/"

ICE_VERSION=3.7.2
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz
	https://github.com/zeroc-ice/ice/archive/v${ICE_VERSION}.tar.gz -> Ice-${ICE_VERSION}.tar.gz"
LICENSE="MIT"
SLOT="0/1.9.0"
KEYWORDS="~x86 ~amd64"
IUSE="db xml json"

RDEPEND="=dev-libs/Ice-3.7*
	xml? ( dev-cpp/libxmlpp:3.0 )
	json? ( >=dev-cpp/libjsonpp-0.11 )
	db? ( =dev-libs/libdbpp-1.4*:= )
	>=dev-libs/libadhocutil-0.7:=
	dev-libs/boost:="
DEPEND="${RDEPEND}
	dev-util/boost-build"

src_unpack() {
	default
	ln -s ${WORKDIR}/ice-${ICE_VERSION}/cpp ${S}/ice/cpp
}

src_compile() {
	bjambuild \
		$(use xml && echo slicer/xml//slicer-xml) \
		$(use json && echo slicer/json//slicer-json) \
		$(use db && echo slicer/db//slicer-db) \
		slicer/slicer//slicer slicer/tool//slicer slicer/ice//slicer-ice || die
}

src_install() {
	bjaminstall slicer//install \
		$(use xml && echo slicer//install-xml) \
		$(use json && echo slicer//install-json) \
		$(use db && echo slicer//install-db) \
		-i ""
}

