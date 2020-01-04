EAPI="7"
inherit bjam

DESCRIPTION="C++ database connectivity ODBC components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/odbc"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	dev-libs/boost:=
	=dev-libs/libdbpp-1.4*:=
	dev-db/unixODBC
	dev-libs/libadhocutil:=
"
DEPEND="
	${RDEPEND}
	dev-util/pkgconfig
	dev-util/boost-build
"

src_compile() {
	bjambuild libodbcpp//dbpp-odbc
}

src_install() {
	bjaminstall libodbcpp//install \
		-i dbpp-odbc
}

