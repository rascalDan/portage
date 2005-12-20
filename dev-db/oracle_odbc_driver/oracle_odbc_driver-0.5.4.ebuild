inherit eutils

DESCRIPTION="ODBC driver for Oracle"
SRC_URI="http://home.fnal.gov/~dbox/oracle/odbc/${PN}.0.5.4.tar.gz"
HOMEPAGE="http://home.fnal.gov/~dbox/oracle/odbc/"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="dev-db/oracle-instantclient-basic dev-db/unixODBC"
#RDEPEND=""

src_compile() {
	unset ARCH
	cd ${WORKDIR}/${PN}
	mv configure configure.old
	# Fix Oracle include path in configure for 10g install
	sed -e "s/\\/oci\\/include/\\/include/g" < configure.old > configure
	chmod +x configure
	econf || die
	emake || die
}

src_install() {
	cd ${WORKDIR}/${PN}
	einstall || die
}

