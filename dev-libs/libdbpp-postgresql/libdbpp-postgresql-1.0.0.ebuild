EAPI="5"

DESCRIPTION="C++ database connectivity PostgreSQL components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/postgresql"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="
	dev-libs/boost
	=dev-libs/libdbpp-1.0*:=
	dev-db/postgresql
	dev-libs/libadhocutil:=
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/libpqpp || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release dbpp-postgresql -q || die
}

src_install() {
	cd ${S}/libpqpp || die

	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install -q \
		--libdir=${D}/usr/lib \
		--includedir=${D}/usr/include/dbpp-postgresql || die
}

