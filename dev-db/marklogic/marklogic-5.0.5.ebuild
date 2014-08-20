# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="MarkLogic"
HOMEPAGE="http://www.marklogic.com/"
SRC_URI="http://developer.marklogic.com/download/binaries/5.0/MarkLogic-5.0-5.x86_64.rpm"
S="${WORKDIR}/MarkLogic-5.0-5.x86_64"

LICENSE="marklogic"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="app-arch/rpm"
RDEPEND="${DEPEND}"

src_unpack() {
	cd ${WORKDIR}
	rpmunpack ${DISTDIR}/MarkLogic-5.0-5.x86_64.rpm || die "Unpack failed"
}

src_install() {
	mkdir -p ${D}/var/opt/MarkLogic
	cp -a ${S}/opt ${D} || die "Install failed"
	
	exeinto /etc/init.d
	newexe ${FILESDIR}/init marklogic
	insinto /usr/lib/systemd/system
	newins ${FILESDIR}/marklogic.service marklogic.service
}
