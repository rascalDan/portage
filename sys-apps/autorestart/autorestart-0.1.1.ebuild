# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

DESCRIPTION="Automatically restart systemd units as required."
HOMEPAGE="https://git.randomdan.homeip.net/cgit.cgi/util/tree/autorestart"
SRC_URI="https://git.randomdan.homeip.net/cgit.cgi/util/snapshot/${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	mail-client/mailx
	sys-apps/coreutils
	sys-apps/findutils
	sys-apps/systemd
	sys-process/lsof
	"

src_install() {
	exeinto /sbin
	doexe ${S}/autorestart/scripts/systemd-restart-as-needed
	dosym ../../../sbin/systemd-restart-as-needed /etc/portage/postsync.d/95-systemd-restart-as-needed
	insinto /etc/autorestart
	doins -r ${S}/autorestart/etc/ignore.d
}

