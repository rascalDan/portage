# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

DESCRIPTION="Virtual package to pull all the bits for hosting virtual machines"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="qemu virtualbox"

DEPEND=""
RDEPEND="
	qemu? (
		app-emulation/qemu
		net-misc/bridge-utils
		sys-apps/usermode-utilities
	)
	virtualbox? (
		app-emulation/virtualbox
		app-emulation/virtualbox-additions
		app-emulation/virtualbox-extpack-oracle
	)
"
REQUIRED_USE="|| ( qemu virtualbox )"
