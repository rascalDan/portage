# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Check status of systemd service"
HOMEPAGE="https://github.com/duffycop/nagios_plugins"
SRC_URI="https://github.com/duffycop/nagios_plugins/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}/nagios_plugins-${PV}"

src_install() {
	exeinto /usr/lib/nagios/plugins/
	newexe ${S}/plugins/${PN} ${PN}
}
