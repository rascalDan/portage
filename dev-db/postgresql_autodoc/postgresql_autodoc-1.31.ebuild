# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/dev-db/postgresql_autodoc/postgresql_autodoc-1.31.ebuild,v 1.1 2008-11-13 19:20:50 dan.goodliffe Exp $

DESCRIPTION="PostgreSQL Autodoc"
HOMEPAGE="http://www.rbt.ca/autodoc/index.html"
SRC_URI="http://www.rbt.ca/autodoc/binaries/postgresql_autodoc-1.31.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="
	dev-perl/HTML-Template
	dev-perl/DBI
	dev-perl/DBD-Pg
	sys-apps/sed
	dev-lang/perl"
RDEPEND="${DEPEND}"

src_compile() {
	cd "${WORKDIR}/postgresql_autodoc"
	./configure
	make
}

src_install() {
	cd "${WORKDIR}/postgresql_autodoc"
	make prefix="${D}/usr/local" install
}


