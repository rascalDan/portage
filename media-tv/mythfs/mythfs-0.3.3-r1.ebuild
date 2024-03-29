# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"
inherit bjam systemd

DESCRIPTION="NetFS daemon module for MythTV"
HOMEPAGE="http://mythfs.randomdan.homeip.net/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="
	=sys-apps/icebox-service-1.11
	>=dev-cpp/slicer-1.9:=[db]
	dev-libs/libdbpp-mysql
	dev-libs/boost:=
	>=dev-libs/icetray-0.3:=
	=sys-cluster/netfs-1.4*
	dev-libs/libadhocutil:=
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-build/b2"

src_compile() {
	bjambuild mythfs//service
}

src_install() {
	bjaminstall mythfs//install
	insinto /etc/mythfs
	doins mythfs/etc/icebox.config
	insinto $(systemd_get_systemunitdir)/icebox@mythfs.service.d
	doins mythfs/etc/service.conf
}

