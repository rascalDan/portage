# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/net-misc/ps3mediaserver/ps3mediaserver-1.10.5-r1.ebuild,v 1.1 2010-03-19 15:12:37 randomdan Exp $

EAPI=2

S="${WORKDIR}/pms-linux-${PV}"

DESCRIPTION="DLNA compliant UPNP server for streaming media to Playstation 3"
HOMEPAGE="http://code.google.com/p/ps3mediaserver"
SRC_URI="http://ps3mediaserver.googlecode.com/files/pms-linux-${PV}.tgz http://www.smlabs.net/tsMuxer/tsMuxeR_1.10.6.tar.gz"

SLOT="0"
KEYWORDS="~x86"
IUSE="transcode non-free"

LICENSE="GPL-2"

DEPEND=""
RDEPEND=">=virtual/jre-1.6.0
		transcode? ( media-video/mplayer[encode] )"


src_unpack(){
	unpack ${A}
	# Upgrade tsMuxeR
	cp "${WORKDIR}/tsMuxeR" "${S}/linux/tsMuxeR"
	cp "${WORKDIR}/licence.txt" "${S}/linux/tsMuxeR_license.txt"
	cd "${S}"
}

src_install(){
	einfo "Installing ${PN}"
	sed 's/DIRNAME=`dirname $0`/DIRNAME=\/usr\/share\/pms/g' < PMS.sh > pms.old
	echo "#/bin/bash" > pms
	echo "" >> pms
	echo "if [ -d \$HOME/.ps3mediaserver ]; then" >> pms
	echo "cd \$HOME/.ps3mediaserver" >> pms
	echo "else" >> pms
	echo "mkdir \$HOME/.ps3mediaserver" >> pms
	echo "cd \$HOME/.ps3mediaserver" >> pms
	echo "fi" >> pms
	echo "if [ ! -e \$HOME/.ps3mediaserver/WEB.conf ]; then" >> pms
	echo "cp /usr/share/pms/WEB.conf \$HOME/.ps3mediaserver" >> pms
	echo "fi" >> pms
	echo "if [ ! -d \$HOME/.ps3mediaserver/linux ]; then" >> pms
	echo "cp -R /usr/share/pms/linux \$HOME/.ps3mediaserver" >> pms
	echo "chmod +x \$HOME/.ps3mediaserver/linux/tsMuxeR" >> pms
	echo "fi" >> pms
	cat pms.old >> pms
	dobin pms
	dodoc CHANGELOG FAQ README
	if ! use non-free ; then
		einfo "Removing tsMuxeR"
		rm linux/tsMuxeR linux/tsMuxeR_licence.txt
	fi
	mkdir ${D}usr/share/pms
	cp -R linux pms.jar WEB.conf ${D}usr/share/pms
}

pkg_postinst(){
	if ! use non-free ; then
		ewarn
		ewarn "tsMuxeR has been removed from install due to to its licensing."
		ewarn "If you require it then rebuild with the 'non-free' use flag."
		ewarn "Also be sure to disable it in your transcoding settings"
		ewarn
	fi
	ewarn
	ewarn "Don't forget to disable transcoding engines for software"
	ewarn "that you don't have installed (such as having the VLC"
	ewarn "transcoding engine enabled when you only have mencoder)."
	ewarn
}
