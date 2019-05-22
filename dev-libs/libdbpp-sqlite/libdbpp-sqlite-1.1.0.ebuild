EAPI="5"
inherit bjam

DESCRIPTION="C++ database connectivity SQLite components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/sqlite"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	dev-libs/boost:=
	=dev-libs/libdbpp-1.1*:=
	dev-db/sqlite
	dev-libs/libadhocutil:=
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_compile() {
	bjambuild libsqlitepp//dbpp-sqlite
}

src_install() {
	bjaminstall libsqlitepp//install \
		-i /dbpp-sqlite
}

