EAPI="7"

inherit bjam

DESCRIPTION="Tools and libs for building web services/sites that are clients of ICE services"
HOMEPAGE="http://icespider.randomdan.homeip.net/"

ICE_VERSION=3.7.4
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0/0.6.7"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="=dev-libs/Ice-${ICE_VERSION}*
	=dev-libs/slice-parser-${ICE_VERSION}*
	>=dev-libs/libadhocutil-0.8.3:=
	dev-cpp/libxmlpp:3.0
	=dev-cpp/slicer-1.10*:=
	dev-libs/fcgi
	>=dev-libs/boost-1.66:="
BDEPEND="${DEPEND}
	dev-util/pkgconfig
	dev-util/boost-build"
RDEPEND="${DEPEND}
	virtual/httpd-fastcgi"

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

