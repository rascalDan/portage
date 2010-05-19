inherit subversion

DESCRIPTION="Database driven website engine"
HOMEPAGE="http://dbweb.randomdan.homeip.net"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/unixODBC www-apache/mod_transform"
RDEPEND="${DEPEND}"
ESVN_REPO_URI="svn+ssh://svn.random.lan/var/svn/src/tags/dbweb_0_4"

src_compile() {
	cd ${S}/libmisc || die
	econf || die
	emake || die
	cd ${S}/libodbcpp || die
	econf || die
	emake || die
	cd ${S}/dbweb || die
	econf || die
	emake || die
}

src_install() {
	insinto /usr/share/webapps/dbweb
	doins ${S}/dbweb/htdocs/.htaccess
	exeinto /usr/share/webapps/dbweb
	doexe ${S}/dbweb/dbweb
}
