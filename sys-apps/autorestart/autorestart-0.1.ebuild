# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Automatically restart systemd units as required."
HOMEPAGE="http://git.randomdan.homeip.net/cgit.cgi/util/tree/autorestart"
SRC_URI="http://git.randomdan.homeip.net/cgit.cgi/util/snapshot/${P}.tar.xz"

LICENSE="gpl"
SLOT="0"
KEYWORDS="~amd64"
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
	exeinto /etc/portage/postsync.d
	doexe ${S}/autorestart/scripts/95-systemd-restart-as-needed
	insinto /etc/autorestart
	doins -r ${S}/autorestart/etc/ignore.d
}

