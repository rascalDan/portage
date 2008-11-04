inherit eutils

DESCRIPTION="ODBC driver for Oracle"
SRC_URI="http://portage.develop.web.dot/instantclient-odbc-linux32-11.1.0.6.zip"
HOMEPAGE="http://portage.develop.web.dot/"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="dev-db/oracle-instantclient-basic dev-db/unixODBC"

src_compile() {
	unset ARCH
}

src_install() {
	mkdir -p ${D}/usr/lib/ || die
	cp ${WORKDIR}/instantclient_11_1/libsqora.so.11.1 ${D}/usr/lib/ || die
}

