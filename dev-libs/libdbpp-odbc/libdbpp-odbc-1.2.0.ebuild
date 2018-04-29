EAPI="5"
inherit bjam

DESCRIPTION="C++ database connectivity ODBC components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/odbc"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	dev-libs/boost
	=dev-libs/libdbpp-1.2*:=
	dev-db/unixODBC
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_compile() {
	bjambuild libodbcpp//dbpp-odbc
}

src_install() {
	bjaminstall libodbcpp//install \
		-i dbpp-odbc
}

