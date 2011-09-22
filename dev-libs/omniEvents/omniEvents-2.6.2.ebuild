# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="omniEvents is an implementation of the OMG Event Services Specification v1.1 for omniORB, a CORBA Object Request Broker for C++ and Python."
HOMEPAGE="http://www.omnievents.org/"
SRC_URI="http://sourceforge.net/projects/omnievents/files/omniEvents%20-%20stable/omniEvents%202.6.2/omniEvents-2_6_2-src.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-misc/omniORB"
RDEPEND="${DEPEND}"
S=${WORKDIR}/omniEvents-2_6_2

src_prepare() {
	epatch "${FILESDIR}"/gcc-4.3.patch || die
}

src_install() {
	emake install DESTDIR="${D}"
}

