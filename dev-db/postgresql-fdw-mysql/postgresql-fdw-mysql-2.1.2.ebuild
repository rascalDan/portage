# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="PostgreSQL foreign data wrapper for MySQL"
HOMEPAGE="https://github.com/EnterpriseDB/mysql_fdw"
SRC_URI="https://github.com/EnterpriseDB/mysql_fdw/archive/REL-${PV//./_}.tar.gz"

LICENSE="mysql_fdw"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/mysql_fdw-REL-${PV//./_}"

DEPEND="
	virtual/libmysqlclient
	>=dev-db/postgresql-9.4
	"
RDEPEND="${DEPEND}"

src_compile() {
	make USE_PGXS=1
}

src_install() {
	make USE_PGXS=1 install DESTDIR="${D}"
}

