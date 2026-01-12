# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

DESCRIPTION="PostgreSQL foreign data wrapper for TDS"
HOMEPAGE="https://github.com/GeoffMontee/tds_fdw"
SRC_URI="https://github.com/GeoffMontee/tds_fdw/archive/v${PV}.tar.gz"

LICENSE="mysql_fdw"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/tds_fdw-${PV}"

DEPEND="
	dev-db/freetds
	>=dev-db/postgresql-9.2
	"
RDEPEND="${DEPEND}"

src_compile() {
	emake USE_PGXS=1
}

src_install() {
	emake USE_PGXS=1 install DESTDIR="${D}"
}

