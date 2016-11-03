# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="Haywire is an asynchronous HTTP server framework written in C."
HOMEPAGE="https://github.com/haywire/haywire"
HWV="35ef50357ff72166cd2327af20722a6e59238e61"
SRC_URI="https://github.com/haywire/haywire/archive/${HWV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/libuv[static-libs]
"
RDEPEND="dev-libs/libuv"
S="${WORKDIR}/${PN}-${HWV}"

src_prepare()
{
	epatch ${FILESDIR}/ee19c6315b575f10b3179572382dd267b84473b6.patch
}

src_compile()
{
	cmake-utils_src_compile haywire
}

src_install()
{
	dolib ${BUILD_DIR}/libhaywire.a
	doheader ${S}/include/haywire.h
}

