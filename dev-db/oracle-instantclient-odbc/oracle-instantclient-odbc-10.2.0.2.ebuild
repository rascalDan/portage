inherit eutils

DESCRIPTION="ODBC driver for Oracle"
SRC_URI="http://portage.develop.web.dot/instantclient-odbc-linux32-10.2.0.2-20060331.zip"
HOMEPAGE="http://portage.develop.web.dot/"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="dev-db/oracle-instantclient-odbc dev-db/unixODBC"

src_compile() {
	unset ARCH
}

src_install() {
	mkdir -p ${D}/usr/lib/ || die
	cp ${WORKDIR}/instantclient_10_2/libsqora.so.10.1 ${D}/usr/lib/ || die
}

