# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Cluster capable network filesytem"
HOMEPAGE="http://netfs.randomdan.homeip.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/Ice
	dev-cpp/libxmlpp
	dev-libs/boost
	dev-util/boost-build"
RDEPEND="${DEPEND}"

