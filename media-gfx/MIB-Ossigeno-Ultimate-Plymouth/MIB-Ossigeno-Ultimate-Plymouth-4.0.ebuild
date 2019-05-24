# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="MIB Ossigeno Ultimate Plymouth 4.0"
HOMEPAGE="http://kde-look.org/content/show.php/MIB+Ossigeno+Ultimate+Plymouth?content=126945"
SRC_URI="http://mib.pianetalinux.org/MIB/2010.1/others/projects/old/MIB-Ossigeno-Ultimate/Tarball/MIB-Ossigeno-Ultimate-Plymouth.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=""
RDEPEND="sys-boot/plymouth"

S=${WORKDIR}/${PN}

src_install()
{
	insinto /usr/share/plymouth/themes/${PN}
	doins *
}

