EAPI="7"
inherit bjam

DESCRIPTION="C++ database connectivity SQLite components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/sqlite"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	dev-libs/boost:=
	>=dev-libs/libdbpp-1.4.10:=
	dev-db/sqlite
	>=dev-libs/libadhocutil-0.9.3:=
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	dev-build/b2
"

src_compile() {
	bjambuild libsqlitepp//dbpp-sqlite
}

src_install() {
	bjaminstall libsqlitepp//install \
		-i /dbpp-sqlite
}

