# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/sys-fs/curlfs/curlfs-0.ebuild,v 1.1 2008-11-20 11:08:36 dan.goodliffe Exp $

inherit cvs

DESCRIPTION="CurlFS FUSE driver"
HOMEPAGE="http://develop.millerbros.co.uk"

LICENSE="MBL"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="sys-fs/fuse net-misc/curl"
RDEPEND="${DEPEND}"

ECVS_SERVER="cvs.millerbros.co.uk:/var/cvs"
ECVS_MODULE="curlfs"
ECVS_USER="cvsanon"
ECVS_AUTH="ext"
ECVS_TOP_DIR=${DISTDIR}/cvs-src/${PN}

src_compile() {
	cd ${WORKDIR}/curlfs/curlfs
	econf
	emake
}

src_install() {
	exeinto /usr/bin
	doexe ${WORKDIR}/curlfs/curlfs/curlfs
	dosym ../usr/bin/curlfs /sbin/mount.curlfs
}
