# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/dev-util/kdbg/kdbg-2.1.0-r1.ebuild,v 1.1 2008-11-29 17:56:18 randomdan Exp $

ARTS_REQUIRED="never"

inherit kde

DESCRIPTION="A Graphical Debugger Interface to gdb."
HOMEPAGE="http://www.kdbg.org/"
SRC_URI="mirror://sourceforge/kdbg/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="amd64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND=">=sys-devel/gdb-5.0"

need-kde 3.5

PATCHES="${FILESDIR}/kdbg-2.1.0-desktop-entry.diff"

src_unpack() {
	unpack ${A}
	cd "${S}"

	# Bring KDE_LDFLAGS before other libraries so that
	# kdbg doesn't link to kde4 libs
	sed -i -e '1,$s/all_libraries \$KDE_LDFLAGS/KDE_LDFLAGS \$all_libraries/' configure
}
