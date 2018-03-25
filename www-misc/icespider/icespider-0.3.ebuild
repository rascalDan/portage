EAPI="5"

inherit bjam

DESCRIPTION="Tools and libraries for building web services/sites that are clients of ICE services"
HOMEPAGE="http://icespider.randomdan.homeip.net/"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/0.2"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="=dev-libs/Ice-3.6*
	dev-libs/libadhocutil:=
	dev-cpp/libxmlpp:3.0
	>=dev-cpp/slicer-1.7:=
	dev-libs/fcgi
	dev-libs/boost"
DEPEND="${DEPEND}
	dev-util/boost-build"

src_compile() {
	bjambuild \
		icespider//common \
		icespider//core \
		icespider//compile \
		icespider//fcgi \
		icespider//xslt \
		icespider//fileSessions \
		icespider//testing
}

src_install() {
	bjaminstall \
		icespider//install \
		icespider//install-ice \
		icespider//install-tools
}

