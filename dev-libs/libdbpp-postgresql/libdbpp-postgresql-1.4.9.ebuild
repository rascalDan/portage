EAPI="7"

inherit bjam

DESCRIPTION="C++ database connectivity PostgreSQL components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/postgresql"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="
	dev-libs/boost:=
	>=dev-libs/libdbpp-1.4.9:=
	dev-db/postgresql
	>=dev-libs/libadhocutil-0.8:=
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	dev-util/b2
"

src_compile() {
	bjambuild libpqpp//dbpp-postgresql
}

src_install() {
	bjaminstall libpqpp//install \
		-i /dbpp-postgresql
}

