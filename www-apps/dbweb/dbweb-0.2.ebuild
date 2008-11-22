# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/www-apps/dbweb/dbweb-0.2.ebuild,v 1.1 2008-11-22 17:49:45 randomdan Exp $

inherit cvs webapp

DESCRIPTION="Database driven website engine"
HOMEPAGE="http://dbweb.randomdan.homeip.net"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
WEBAPP_MANUAL_SLOT="yes"

DEPEND="dev-db/unixODBC www-apache/mod_transform"
RDEPEND="${DEPEND}"

ECVS_SERVER="cvs.random.lan:/var/cvs"
ECVS_AUTH="ext"
ECVS_USER="cvsanon"
ECVS_MODULE="dbweb"
ECVS_BRANCH="dbweb_0_2"
ECVS_TOP_DIR=${DISTDIR}/cvs-src/${PN}

pkg_setup() {
	webapp_pkg_setup
}

src_compile() {
	cd ${WORKDIR}/dbweb/libmisc
	econf
	emake
	cd ${WORKDIR}/dbweb/libodbcpp
	econf
	emake
	cd ${WORKDIR}/dbweb/dbweb
	econf
	emake
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins ${WORKDIR}/dbweb/dbweb/htdocs/.htaccess
	exeinto "${MY_HTDOCSDIR}"
	doexe ${WORKDIR}/dbweb/dbweb/dbweb

	webapp_src_install
}
