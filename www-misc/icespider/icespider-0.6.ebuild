EAPI="5"

inherit bjam

DESCRIPTION="Tools and libs for building web services/sites that are clients of ICE services"
HOMEPAGE="http://icespider.randomdan.homeip.net/"

ICE_VERSION=3.7.2
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz
	https://github.com/zeroc-ice/ice/archive/v${ICE_VERSION}.tar.gz -> Ice-${ICE_VERSION}.tar.gz"
LICENSE="MIT"
SLOT="0/0.6"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="=dev-libs/Ice-3.7*
	>=dev-libs/libadhocutil-0.7:=
	dev-cpp/libxmlpp:3.0
	>=dev-cpp/slicer-1.9.0:=
	dev-libs/fcgi
	>=dev-libs/boost-1.66:="
DEPEND="${DEPEND}
	dev-util/boost-build"

src_unpack() {
	default
	ln -s ${WORKDIR}/ice-${ICE_VERSION}/cpp ${S}/ice/cpp
}

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

