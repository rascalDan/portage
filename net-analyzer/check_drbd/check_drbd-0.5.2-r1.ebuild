# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Checks the state of DRBD devices"
HOMEPAGE="https://exchange.nagios.org/directory/Plugins/Operating-Systems/Linux/check_drbd/details"
SRC_URI="https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=3367&cf_id=24 -> ${P}"

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

