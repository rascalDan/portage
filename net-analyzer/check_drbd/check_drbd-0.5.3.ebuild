# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Checks the state of DRBD devices"
HOMEPAGE="https://exchange.nagios.org/directory/Plugins/Operating-Systems/Linux/check_drbd/details"
SRC_URI="https://exchange.nagios.org/wp-content/uploads/project-files/2009/06/check_drbd -> ${P}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/perl"
BDEPEND=""

src_unpack() {
	mkdir -p ${S}
	cp ${DISTDIR}/${A} ${S}
}
src_install() {
	exeinto /usr/$(get_libdir)/nagios/plugins/
	newexe ${S}/${A} ${PN}
}

