# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"
inherit autotools

DESCRIPTION="Support programs for the Oracle Cluster Filesystem 2"
HOMEPAGE="http://oss.oracle.com/projects/ocfs2-tools/ https://github.com/markfasheh/ocfs2-tools"
SRC_URI="https://github.com/markfasheh/${PN}/archive/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug pacemaker"

RDEPEND="
	dev-libs/libaio
	sys-apps/util-linux
	pacemaker? (
		sys-cluster/dlm
		sys-cluster/pacemaker
		)
	sys-fs/e2fsprogs
	sys-libs/ncurses
	sys-libs/readline
	sys-process/psmisc
"
# 99% of deps this thing has is automagic
# specialy cluster things corosync/pacemaker
DEPEND="${RDEPEND}"
S="${WORKDIR}/${PN}-${P}"

DOCS=(
	"${S}/documentation/samples/cluster.conf"
	"${S}/documentation/users_guide.txt"
)

MAKEOPTS+=" -j1"

src_prepare() {
	default
	# gentoo uses /sys/kernel/dlm as dlmfs mountpoint
	sed -e 's:"/dlm/":"/sys/kernel/dlm":g' \
		-i libo2dlm/o2dlm_test.c \
		-i libocfs2/dlm.c || die "sed failed"
	AT_M4DIR=. eautoreconf
}

src_configure() {
	econf \
		$(use_enable debug debug) \
		$(use_enable debug debugexe) \
		--enable-dynamic-fsck \
		--enable-dynamic-ctl
}

src_install() {
	default
	newinitd "${FILESDIR}/ocfs2.initd" ocfs2
	newconfd "${FILESDIR}/ocfs2.confd" ocfs2
}
