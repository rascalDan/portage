inherit eutils

DESCRIPTION="Oracle ProC Precompiler"
SRC_URI="http://portage.develop.web.dot/${P}.tar.gz"
HOMEPAGE="http://portage.develop.web.dot"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="dev-db/oracle-instantclient-basic"
RESTRICT="nomirror"

src_compile() {
	unset ARCH
}

src_install() {
	cd ${WORKDIR}/${P}/usr/lib/oracle
	mv version `echo $ORACLE_HOME | cut -d / -f 5`
	cd ${WORKDIR}/${P}
	cp -R * ${D}
}

