inherit eutils

MY_P_x86="${PN/oracle-/}-linux32-${PV}"
MY_P_amd64="${PN/oracle-/}-linux-x86-64-${PV}"

S=${WORKDIR}
DESCRIPTION="Oracle 11g client installation for Linux: SQL*Plus"
HOMEPAGE="http://www.oracle.com/technology/tech/oci/instantclient/index.html"
SRC_URI="amd64? ( ${MY_P_amd64}.zip )
		 x86? ( ${MY_P_x86}.zip )"

LICENSE="OTN"
SLOT="0"
KEYWORDS="-* amd64 x86"
RESTRICT="fetch"
IUSE=""

RDEPEND=">=dev-db/oracle-instantclient-basic-${PV}"
DEPEND="${RDEPEND}
	app-arch/unzip"

pkg_setup() {
	MY_P=MY_P_${ARCH}
	export MY_P=${!MY_P}
}

pkg_nofetch() {
	eerror "Please go to:"
	eerror "  ${HOMEPAGE}"
	eerror "select your platform and download the"
	eerror "SQL*Plus package.  Put it in:"
	eerror "  ${DISTDIR}"
	eerror "after downloading it."
}

src_unpack() {
	unzip "${DISTDIR}"/${MY_P}.zip
}

src_install() {
	dodir /usr/$(get_libdir)/oracle/${PV}/client/lib
	cd "${S}"/instantclient_11_1
	insinto /usr/$(get_libdir)/oracle/${PV}/client/lib
	doins glogin.sql libsqlplus.so libsqlplusic.so

	dodir /usr/$(get_libdir)/oracle/${PV}/client/bin
	cd "${S}"/instantclient_11_1
	exeinto /usr/$(get_libdir)/oracle/${PV}/client/bin
	doexe sqlplus

	dodir /usr/bin
	dosym "${D}"/usr/$(get_libdir)/oracle/${PV}/client/bin/sqlplus /usr/bin/sqlplus
}

pkg_postinst() {
	elog "The SQL*Plus package for Oracle 11g has been installed."
	elog "You may wish to install the oracle-instantclient-jdbc (for"
	elog "the supplemental JDBC functionality) package as well."
	elog
	elog "If you have any questions, be sure to read the README:"
	elog "http://otn.oracle.com/docs/tech/sql_plus/11106/readme_ic.htm"
	elog
	elog "oracle-instantclient-* packages aren't installed in different"
	elog "SLOTs any longer. You may want to uninstall older versions."
}
