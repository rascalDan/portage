EAPI="5"

inherit bjam

DESCRIPTION="Tools and libraries for building web services/sites that are clients of ICE services"
HOMEPAGE="http://icespider.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/0.1"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-libs/Ice
	dev-libs/libadhocutil
	dev-cpp/libxmlpp:3.0
	dev-cpp/slicer:=
	dev-libs/fcgi
	dev-libs/boost"
DEPEND="${DEPEND}
	dev-util/boost-build"

src_compile() {
	cd ${S}/icespider || die
	bjambuild variant=release \
		common core compile fcgi xslt fileSessions testing || die
}

src_install() {
	cd ${S}/icespider || die
	bjambuild variant=release --prefix=${D}/usr --includedir=/${D}/usr/include/icespider \
		install \
		install-ice \
		install-tools || die
}

