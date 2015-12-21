EAPI="5"

DESCRIPTION="C++ database connectivity SQLite components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/sqlite"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="
	dev-libs/boost
	dev-libs/libdbpp:=
	dev-db/sqlite
	dev-libs/libadhocutil
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/libsqlitepp || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release dbpp-sqlite -q || die
}

src_install() {
	cd ${S}/libsqlitepp || die

	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install -q \
		--libdir=${D}/usr/lib \
		--includedir=${D}/usr/include/dbpp-sqlite || die
}

