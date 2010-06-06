inherit subversion

DESCRIPTION="Programable database data mangler"
HOMEPAGE="http://dbmaint.randomdan.homeip.net"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/unixODBC
	dev-libs/libxml2"
RDEPEND="${DEPEND}"
ESVN_REPO_URI="svn+ssh://svn.random.lan/var/svn/src/tags/${PF}"

src_compile() {
	cd ${S}/libmisc || die
	econf || die
	emake || die
	cd ${S}/libodbcpp || die
	econf || die
	emake || die
	cd ${S}/dbmaint || die
	econf || die
	emake || die
}

src_install() {
	exeinto /usr/bin
	doexe ${S}/dbmaint/dbmaint
}
