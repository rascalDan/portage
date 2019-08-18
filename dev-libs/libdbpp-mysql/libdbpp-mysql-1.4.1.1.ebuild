EAPI="5"
inherit bjam

DESCRIPTION="C++ database connectivity MySQL components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/mysql"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	dev-libs/boost:=
	=dev-libs/libdbpp-1.4*:=
	<virtual/libmysqlclient-21
	>=dev-libs/libadhocutil-0.7:=
"
DEPEND="
	${RDEPEND}
	dev-util/pkgconfig
	dev-util/boost-build
"

src_compile() {
	bjambuild libmysqlpp//dbpp-mysql
}

src_install() {
	bjaminstall libmysqlpp//install \
		-i dbpp-mysql
}

