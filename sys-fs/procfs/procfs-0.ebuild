# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/sys-fs/procfs/procfs-0.ebuild,v 1.1 2008-11-25 10:55:19 dan.goodliffe Exp $

inherit cvs

DESCRIPTION="ProcFS FUSE driver"
HOMEPAGE="http://develop.millerbros.co.uk"

LICENSE="MBL"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="sys-fs/fuse dev-libs/libxml2 x11-misc/makedepend"
RDEPEND="${DEPEND}"

ECVS_SERVER="cvs.millerbros.co.uk:/var/cvs"
ECVS_MODULE="procfs"
ECVS_USER="cvsanon"
ECVS_AUTH="ext"
ECVS_TOP_DIR=${DISTDIR}/cvs-src/${PN}

src_compile() {
	cd ${WORKDIR}/procfs/procfs
	econf
	emake
}

src_install() {
	exeinto /usr/bin
	doexe ${WORKDIR}/procfs/procfs/procfs
	dosym ../usr/bin/procfs /sbin/mount.procfs
}
