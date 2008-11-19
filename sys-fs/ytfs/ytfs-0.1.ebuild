# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/sys-fs/ytfs/ytfs-0.1.ebuild,v 1.1 2008-11-19 02:43:55 randomdan Exp $

inherit cvs

DESCRIPTION="YouTube filesystem"
HOMEPAGE="http://ytfs.randomdan.homeip.net"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-fs/fuse
net-misc/curl
dev-libs/libxml2"
RDEPEND="${DEPEND}"

ECVS_SERVER="cvs.random.lan:/var/cvs"
ECVS_MODULE="ytfs"
ECVS_TOP_DIR=${DISTDIR}/cvs-src/${PN}

src_compile() {
	cd ${WORKDIR}/ytfs/libmisc
	econf
	emake
	cd ${WORKDIR}/ytfs/ytfs
	econf
	emake
}

src_install() {
	exeinto "/usr/bin"
	doexe ${WORKDIR}/ytfs/ytfs/ytfs
	into "/sbin"
	dosym ../usr/bin/ytfs /sbin/mount.ytfs
}
