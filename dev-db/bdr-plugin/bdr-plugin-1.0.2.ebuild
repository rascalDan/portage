# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Bi-Directional Multi-Master Replication (BDR) for PostgreSQL"
HOMEPAGE="http://2ndquadrant.com/en/resources/bdr/"
# 1.0.2 from dev-bdr96
COMMIT=80af2ab71121b3d2332560f59ffabd8a4d05b0ab
SRC_URI="https://github.com/2ndQuadrant/bdr/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=dev-db/postgresql-9.6*[server,static-libs]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/bdr-${COMMIT}"

src_prepare() {
	epatch ${FILESDIR}/32bit.patch
}

src_compile() {
	emake USE_PGXS=1
}

