# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Project2 based lightweight PVR"
HOMEPAGE="http://p2pvr.randomdan.homeip.net"

SRC_URI="http://releases.randomdan.homeip.net/download/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x64"
IUSE=""

DEPEND="
	dev-util/boost-build
	>=dev-libs/Ice-3.5
	>=www-apps/project2-841[postgres,daemon]
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/p2pvr || die
	setarch $(uname -m) -RL \
			${BJAM} ${BJAMOPTS} -q \
			|| die "Compile failed"
}

src_install() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/p2pvr || die
	setarch $(uname -m) -RL \
			${BJAM} ${BJAMOPTS} -q install \
			--prefix=${D}/usr \
			|| die "Installed failed"
	insinto /usr/share/doc/${PN}
	dodoc doc/*
	insinto /usr/share/${PN}/ice
	doins ice/*.ice
	insinto /etc/${PN}
	doins .p2config
	insinto /etc/${PN}/datasources
	doins datasources/*.xml
}
