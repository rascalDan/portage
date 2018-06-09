EAPI="5"

inherit bjam

DESCRIPTION="C++ database connectivity PostgreSQL components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/postgresql"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="
	dev-libs/boost:=
	=dev-libs/libdbpp-1.1*:=
	>=dev-libs/libdbpp-1.1.2:=
	dev-db/postgresql
	>=dev-libs/libadhocutil-0.4.1:=
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_compile() {
	bjambuild libpqpp//dbpp-postgresql
}

src_install() {
	bjaminstall libpqpp//install \
		-i /dbpp-postgresql
}

