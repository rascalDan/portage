# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Bi-Directional Multi-Master Replication (BDR) for PostgreSQL"
HOMEPAGE="http://2ndquadrant.com/en/resources/bdr/"
SRC_URI="
	https://github.com/2ndQuadrant/bdr/archive/bdr-plugin/${PV}.tar.gz -> ${P}.tar.gz
	postgresql-9.6.1.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=dev-db/postgresql-9.6*[server]"
RDEPEND="${DEPEND}"

bdrS="${WORKDIR}/bdr-bdr-plugin-1.0.2"
pqS="${WORKDIR}/postgresql-9.6.1"
S=${bdrS}

src_prepare() {
	cd ${bdrS}
	epatch ${FILESDIR}/postgresql-9.6.patch.xz
	epatch ${FILESDIR}/32bit.patch
}

src_configure() {
	cd ${pqS}
	econf
	cd ${bdrS}
	econf
}

src_compile() {
	emake -C ${pqS}/src/port
	emake -C ${pqS}/src/common
	emake -C ${pqS}/src/fe_utils
	emake -C ${bdrS} LDFLAGS=-L${pqS}/src/common/\ -L${pqS}/src/port\ -L${pqS}/src/fe_utils
}

