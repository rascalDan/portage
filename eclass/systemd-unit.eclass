# Distributed under the terms of the GNU General Public License v2
# $Id$

#
# Original Author: randomdan
# Purpose: systemd-unit files
#

inherit "systemd"
DESCRIPTION="${PN}"
HOMEPAGE="http://git.randomdan.homeip.net/cgit.cgi/util/tree/systemd-units"
SRC_URI="http://git.randomdan.homeip.net/cgit.cgi/util/plain/systemd-units/${PN/-/.}?id=${P} -> ${P/-/.}"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

src_unpack()
{
	mkdir ${S}
	cp ${DISTDIR}/${A} ${S}/${TARGETNAME:=${PN/-/.}}
}

src_install()
{
	systemd_dounit ${S}/${TARGETNAME:=${PN/-/.}}
}

