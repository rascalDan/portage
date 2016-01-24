# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Bi-Directional Multi-Master Replication (BDR) for PostgreSQL"
HOMEPAGE="http://2ndquadrant.com/en/resources/bdr/"
SRC_URI="https://github.com/2ndQuadrant/bdr/archive/bdr-plugin/0.9.3-2.tar.gz postgresql-9.4.5.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=dev-db/postgresql-9.4*[server]"
RDEPEND="${DEPEND}"

bdrS="${WORKDIR}/bdr-bdr-plugin-0.9.3-2"
pqS="${WORKDIR}/postgresql-9.4.5"
S=${bdrS}

src_configure() {
	cd ${pqS}
	econf
	cd ${bdrS}
	econf
}

src_compile() {
	emake -C ${pqS}/src/port
	emake -C ${pqS}/src/common
	emake -C ${bdrS} LDFLAGS=-L${pqS}/src/common/\ -L${pqS}/src/port
}

