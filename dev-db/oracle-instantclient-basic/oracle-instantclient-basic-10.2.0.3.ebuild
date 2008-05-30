# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/dev-db/oracle-instantclient-basic/oracle-instantclient-basic-10.2.0.3.ebuild,v 1.1 2008-01-09 12:13:08 randomdan Exp $

inherit eutils

MY_P_x86="http://portage.develop.web.dot/${PN/oracle-/}-linux32-${PV}-20061115"
MY_PSDK_x86="${MY_P_x86/basic/sdk}"

MY_P_amd64="http://portage.develop.web.dot/${PN/oracle-/}-linux-x86-64-${PV}-20070103"
MY_PSDK_amd64="${MY_P_amd64/basic/sdk}"

S=${WORKDIR}
DESCRIPTION="Oracle 10g client installation for Linux with SDK"
HOMEPAGE="http://www.oracle.com/technology/tech/oci/instantclient/index.html"
SRC_URI="amd64? ( ${MY_P_amd64}.zip ${MY_PSDK_amd64}.zip )
		 x86? ( ${MY_P_x86}.zip ${MY_PSDK_x86}.zip )"

LICENSE="OTN"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="|| ( =sys-libs/libstdc++-v3-3.3* =sys-devel/gcc-3.3* )"

my_arch() {
	MY_P=MY_P_${ARCH}
	export MY_P=${!MY_P}
	MY_PSDK=MY_PSDK_${ARCH}
	export MY_PSDK=${!MY_PSDK}
}

pkg_setup() {
	my_arch
}

pkg_nofetch() {
	my_arch
	eerror "Please go to:"
	eerror "  ${HOMEPAGE}"
	eerror "select your platform and download the"
	eerror "Basic client package with SDK, which are:"
	eerror "  ${MY_P}.zip"
	eerror "  ${MY_PSDK}.zip"
	eerror "Then after downloading put them in:"
	eerror "  ${DISTDIR}"
}

src_unpack() {
	unzip ${DISTDIR}/${MY_P}.zip || die "unsuccesful unzip ${MY_P}.zip"
	unzip ${DISTDIR}/${MY_PSDK}.zip || die "unsuccesful unzip ${MY_PSDK}.zip"
}

src_install() {
	# Patch the SDK makefile
	epatch ${FILESDIR}/${P}-makefile.patch

	# SDK makefile
	dodir /usr/lib/oracle/${PV}/client/rdbms/demo
	cd ${S}/instantclient_10_2/sdk/demo
	mv demo.mk demo_xe.mk
	insinto /usr/lib/oracle/${PV}/client/rdbms/demo
	doins demo_xe.mk

	# library
	dodir /usr/lib/oracle/${PV}/client/lib
	cd ${S}/instantclient_10_2
	insinto /usr/lib/oracle/${PV}/client/lib
	doins *.jar *.so *.so.10.1

	# fixes symlinks
	dosym /usr/lib/oracle/${PV}/client/lib/libocci.so.10.1 /usr/lib/oracle/${PV}/client/lib/libocci.so
	dosym /usr/lib/oracle/${PV}/client/lib/libclntsh.so.10.1 /usr/lib/oracle/${PV}/client/lib/libclntsh.so

	# includes
	dodir /usr/lib/oracle/${PV}/client/include
	insinto /usr/lib/oracle/${PV}/client/include
	cd ${S}/instantclient_10_2/sdk/include
	doins *.h
	# link to original location
	dodir /usr/include/oracle/${PV}/
	ln -s ${D}/usr/lib/oracle/${PV}/client/include ${D}/usr/include/oracle/${PV}/client

	# share info
	cd ${S}/instantclient_10_2/sdk/demo
	dodoc *

	# Add OCI libs to library path
	dodir /etc/env.d
	echo "ORACLE_HOME=/usr/lib/oracle/${PV}/client" >> ${D}/etc/env.d/50oracle-instantclient-basic
	echo "LDPATH=/usr/lib/oracle/${PV}/client/lib" >> ${D}/etc/env.d/50oracle-instantclient-basic
	echo "C_INCLUDE_PATH=/usr/lib/oracle/${PV}/client/include" >> ${D}/etc/env.d/50oracle-instantclient-basic
}

pkg_postinst() {
	elog "The Basic client page for Oracle 10g has been installed."
	elog "You may also wish to install the oracle-instantclient-jdbc (for"
	elog "supplemental JDBC functionality with Oracle) and the"
	elog "oracle-instantclient-sqlplus (for running the SQL*Plus application)"
	elog "packages as well."
	elog
	elog "Examples are located in /usr/share/doc/${PF}/"
	elog
	elog "oracle-instantclient-* packages aren't installed in different"
	elog "SLOTs any longer. You may want to uninstall older versions."
}