# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/app-misc/phonemanager-lite/phonemanager-lite-2.2.106-r1.ebuild,v 1.1 2008-11-19 14:05:37 dan.goodliffe Exp $

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
}
