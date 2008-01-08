# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/dev-db/oracle-instantclient-sqlplus/oracle-instantclient-sqlplus-10.2.0.3.ebuild,v 1.1 2008-01-08 19:53:42 randomdan Exp $

inherit eutils

MY_P_x86="http://portage.develop.web.dot/${PN/oracle-/}-linux32-${PV}-20061115"
MY_P_amd64="http://portage.develop.web.dot/${PN/oracle-/}-linux-x86-64-${PV}-20070103"

S=${WORKDIR}
DESCRIPTION="Oracle 10g client installation for Linux: SQL*Plus"
HOMEPAGE="http://www.oracle.com/technology/tech/oci/instantclient/index.html"
SRC_URI="amd64? ( ${MY_P_amd64}.zip )
		 x86? ( ${MY_P_x86}.zip )"

LICENSE="OTN"
SLOT="0"
KEYWORDS="-* ~amd64 x86"
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
	unzip ${DISTDIR}/${MY_P}.zip
}

src_install() {
	dodir /usr/lib/oracle/${PV}/client/lib
	cd ${S}/instantclient_10_2
	insinto /usr/lib/oracle/${PV}/client/lib
	doins glogin.sql libsqlplus.so libsqlplusic.so

	dodir /usr/lib/oracle/${PV}/client/bin
	cd ${S}/instantclient_10_2
	exeinto /usr/lib/oracle/${PV}/client/bin
	doexe sqlplus

	dodir /usr/bin
	dosym ${D}/usr/lib/oracle/${PV}/client/bin/sqlplus /usr/bin/sqlplus
}

pkg_postinst() {
	elog "The SQL*Plus package for Oracle 10g has been installed."
	elog "You may wish to install the oracle-instantclient-jdbc (for"
	elog "the supplemental JDBC functionality) package as well."
	elog
	elog "If you have any questions, be sure to read the README:"
	elog "http://otn.oracle.com/docs/tech/sql_plus/10102/readme_ic.htm"
	elog
	elog "oracle-instantclient-* packages aren't installed in different"
	elog "SLOTs any longer. You may want to uninstall older versions."
}
