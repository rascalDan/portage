EAPI=5

inherit user bjam

DESCRIPTION="Project2 based lightweight PVR"
HOMEPAGE="http://p2pvr.randomdan.homeip.net"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x64"
IUSE=""

RDEPEND="
>=dev-cpp/slicer-1.8:=[db]
=dev-libs/Ice-3.7*
=dev-libs/libadhocutil-0.6*:=
dev-libs/icetray
dev-libs/libdbpp-postgresql
"
DEPEND="${RDEPEND}
dev-util/boost-build"

pkg_preinst() {
	enewuser p2pvr -1 -1 /etc/p2pvr "video"
}

src_compile() {
	bjambuild p2pvr//finallib
}

src_install() {
	dodoc p2pvr/doc/*
	insinto /usr/share/p2pvr/ice
	doins p2pvr/ice/*.ice
	insinto /usr/share/p2pvr/sql
	doins p2pvr/datasources/schema.sql
	insinto /etc
	doins -r p2pvr/etc/p2pvrd
	doins -r p2pvr/etc/p2pvrcd

	bjaminstall p2pvr//install
}

