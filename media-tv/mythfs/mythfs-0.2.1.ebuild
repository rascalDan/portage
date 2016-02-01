# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="NetFS daemon module for MythTV"
HOMEPAGE="http://mythfs.randomdan.homeip.net/"
SRC_URI="http://releases.randomdan.homeip.net/git-modules/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
	sys-apps/icebox-service
	dev-cpp/slicer:=[db]
	dev-libs/boost
	sys-cluster/netfs
	dev-libs/libadhocutil:=
"
RDEPEND="${DEPEND}
	dev-util/boost-build"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/mythfs || die
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release -q service || die
}

src_install() {
	cd ${S}/mythfs || die
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release -q install --prefix=${D}/usr || die
	insinto /etc/mythfs || die
	doins etc/icebox.config
	insinto /usr/lib/systemd/system/icebox@mythfs.service.d || die
	doins ${FILESDIR}/service.conf || die
}

