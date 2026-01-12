# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/dev-db/postgresql_autodoc/postgresql_autodoc-1.31.ebuild,v 1.1 2008-11-13 19:20:50 dan.goodliffe Exp $

EAPI="7"
DESCRIPTION="PostgreSQL Autodoc"
HOMEPAGE="https://github.com/cbbrowne/autodoc"
COMMIT_HASH="80a6b150febb5c0c91f2daa433cc089ff1278841"
SRC_URI="https://github.com/cbbrowne/autodoc/archive/${COMMIT_HASH}.tar.gz -> ${P}.tar.gz"

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
S="$WORKDIR/autodoc-$COMMIT_HASH"

src_install() {
	emake \
		PREFIX="/usr" \
		DESTDIR="${D}" \
		install -C "${WORKDIR}/autodoc-${COMMIT_HASH}"
}

