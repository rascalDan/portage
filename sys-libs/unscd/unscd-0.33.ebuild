# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/sys-libs/unscd/unscd-0.33.ebuild,v 1.1 2008-10-27 11:06:18 dan.goodliffe Exp $
inherit eutils

DESCRIPTION="Drop-in replacement for glibc nscd designed for simplicity and stability"
HOMEPAGE="http://busybox.net/~vda/unscd/"
SRC_URI="http://busybox.net/~vda/unscd/nscd-${PV}.c"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	mkdir "${WORKDIR}/src" "${WORKDIR}/rc" || die "preparation failed"
	cp "${DISTDIR}/${A}" "${WORKDIR}/src/unscd.c" || die "preparation failed"
	cp "${FILESDIR}/unscd.init" "${WORKDIR}/rc/unscd" || die "preparation failed"
	epatch "${FILESDIR}/patch-pid_file_location.diff" || die "patch failed"
}

src_compile() {
	emake src/unscd || die "emake failed"
	chmod 0755 rc/unscd || die "rc script failed"
}

src_install() {
	exeinto /usr/sbin
	doexe src/unscd || die "install failed"
	exeinto /etc/init.d
	doexe rc/unscd || die "install failed"
}
