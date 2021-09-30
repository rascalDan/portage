# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit perl-module

DESCRIPTION="High-Availibility for Postgres, based on Pacemaker and Corosync."
HOMEPAGE="http://clusterlabs.github.io/PAF/"
SRC_URI="https://github.com/ClusterLabs/PAF/releases/download/v2.3.0/PAF-v${PV}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
S="${WORKDIR}/PAF-v${PV}"

DEPEND=""
RDEPEND="${DEPEND}
>=sys-cluster/pacemaker-1.1
>=dev-db/postgresql-9.3"
BDEPEND="dev-perl/Module-Build"
