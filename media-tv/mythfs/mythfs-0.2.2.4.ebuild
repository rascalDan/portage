# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit bjam systemd

DESCRIPTION="NetFS daemon module for MythTV"
HOMEPAGE="http://mythfs.randomdan.homeip.net/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
	sys-apps/icebox-service
	>=dev-cpp/slicer-1.4:=[db]
	dev-libs/libdbpp-mysql
	dev-libs/boost
	>=dev-libs/icetray-0.1.3:=
	>=sys-cluster/netfs-1.2
	<sys-cluster/netfs-1.2.0.4
	dev-libs/libadhocutil:=
"
RDEPEND="${DEPEND}
	dev-util/boost-build"

src_compile() {
	bjambuild mythfs//service
}

src_install() {
	bjaminstall mythfs//install
	insinto /etc/mythfs || die
	doins etc/icebox.config
	insinto $(systemd_get_systemunitdir)/icebox@mythfs.service.d || die
	doins ${FILESDIR}/service.conf || die
}

