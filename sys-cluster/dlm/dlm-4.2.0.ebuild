# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="userspace management for linux/fs/dlm"
HOMEPAGE="https://pagure.io/dlm"
SRC_URI="https://releases.pagure.org/${PN}/${P}.tar.gz"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-cluster/corosync
sys-apps/util-linux
sys-apps/systemd
"
RDEPEND="${DEPEND}"
BDEPEND="sys-cluster/pacemaker"
