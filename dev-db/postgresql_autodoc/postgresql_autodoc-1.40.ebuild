# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/dev-db/postgresql_autodoc/postgresql_autodoc-1.31.ebuild,v 1.1 2008-11-13 19:20:50 dan.goodliffe Exp $

DESCRIPTION="PostgreSQL Autodoc"
HOMEPAGE="http://www.rbt.ca/autodoc/index.html"
SRC_URI="http://www.rbt.ca/autodoc/binaries/${PF}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="
	dev-perl/HTML-Template
	dev-perl/DBI
	dev-perl/TermReadKey
	dev-perl/DBD-Pg
	sys-apps/sed
	dev-lang/perl"
RDEPEND="${DEPEND}"

src_compile() {
	make -C "${WORKDIR}/postgresql_autodoc" || die
}

src_install() {
	make PREFIX="${D}/usr/local" install -C "${WORKDIR}/postgresql_autodoc" || die
}


