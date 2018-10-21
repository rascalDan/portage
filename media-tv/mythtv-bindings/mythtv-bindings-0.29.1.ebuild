# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

BACKPORTS="d8a2db77f5731cf32c6d31127452391c6cf7f91f"
MY_P=${P%_p*}
MY_PV=${PV%_p*}

inherit eutils vcs-snapshot

DESCRIPTION="Homebrew PVR project bindings"
HOMEPAGE="https://www.mythtv.org"
SRC_URI="https://github.com/MythTV/mythtv/archive/${BACKPORTS}.tar.gz -> mythtv-${PV}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0/${PV}"
IUSE="python perl"

S="${WORKDIR}/mythtv-${BACKPORTS}/mythtv"

src_unpack() {
	tar -zxf "${DISTDIR}/${A}" mythtv-${BACKPORTS}/mythtv/bindings
	find ${S} -name .gitignore -delete
	find ${S} -name Makefile -delete
}

src_install() {
	insinto /usr/share/mythtv/bindings
	doins -r ${S}/bindings/php
	use perl && doins -r ${S}/bindings/perl
	use python && doins -r ${S}/bindings/python
}

