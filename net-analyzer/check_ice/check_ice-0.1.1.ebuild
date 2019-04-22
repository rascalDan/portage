# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit bjam

DESCRIPTION="Monitoring plugin for checking availability of ZeroC ICE service"
HOMEPAGE="https://github.com/rascalDan/check_ice"
SRC_URI="https://github.com/rascalDan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost:=
	dev-libs/libadhocutil
	"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/boost-build"

src_compile() {
	bjambuild
}

src_install() {
	bjaminstall install --bindir="${D}/usr/lib/nagios/plugins/"
}

