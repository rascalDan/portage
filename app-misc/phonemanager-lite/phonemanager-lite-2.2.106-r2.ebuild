# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/app-misc/phonemanager-lite/phonemanager-lite-2.2.106-r2.ebuild,v 1.1 2008-12-12 13:12:26 dan.goodliffe Exp $

DESCRIPTION="Phone manager lite"
HOMEPAGE=""
SRC_URI="http://develop.millerbros.co.uk/${P}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="app-emulation/wine"
RDEPEND="app-emulation/wine"

src_install() {
	insinto "/usr/local/bin"
	doins ${WORKDIR}/usr/local/bin/phonemanager-lite/*

	exeinto "/usr/local/bin"
	doexe ${WORKDIR}/usr/local/bin/phonemanager-lite/*.exe

	insinto "/usr/share/phonemanager-lite"
	doins ${FILESDIR}/alchemy.reg
	doins ${FILESDIR}/license.reg
}
