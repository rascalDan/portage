# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit bjam

DESCRIPTION="Simple HAProxy agent daemon for dynamic controlling backend weight based on load"
HOMEPAGE="https://github.com/rascalDan/haproxy-load-daemon"
SRC_URI="https://github.com/rascalDan/${PN}/archive/refs/tags/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-libs/boost sys-apps/systemd"
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}/${PN}-${P}"

src_compile() {
	bjambuild haproxy-load-daemon
}

src_install() {
	bjaminstall install
}
