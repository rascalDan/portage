inherit cvs

DESCRIPTION="Database driven website engine"
HOMEPAGE="http://dbweb.randomdan.homeip.net"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/unixODBC www-apache/mod_transform"
RDEPEND="${DEPEND}"

ECVS_SERVER="cvs.random.lan:/var/cvs"
ECVS_AUTH="ext"
ECVS_USER="cvsanon"
ECVS_MODULE="dbweb"
ECVS_BRANCH="dbweb_0_3"
ECVS_TOP_DIR=${DISTDIR}/cvs-src/${PN}

src_compile() {
	cd ${WORKDIR}/dbweb/libmisc
	econf || die
	emake || die
	cd ${WORKDIR}/dbweb/libodbcpp
	econf || die
	emake || die
	cd ${WORKDIR}/dbweb/dbweb
	econf || die
	emake || die
}

src_install() {
	insinto /usr/share/webapps/dbweb
	doins ${WORKDIR}/dbweb/dbweb/htdocs/.htaccess
	exeinto /usr/share/webapps/dbweb
	doexe ${WORKDIR}/dbweb/dbweb/dbweb
}
