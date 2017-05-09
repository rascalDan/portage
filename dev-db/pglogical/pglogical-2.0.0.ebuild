# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Logical Replication extension for PostgreSQL 9.4, 9.5 and 9.6 (Postgres)"
HOMEPAGE="https://github.com/2ndQuadrant/pglogical"
SRC_URI="https://github.com/2ndQuadrant/${PN}/archive/REL${PV//./_}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=dev-db/postgresql-9.6*[server,static-libs]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-REL${PV//./_}/"

src_compile() {
	emake USE_PGXS=1
}

