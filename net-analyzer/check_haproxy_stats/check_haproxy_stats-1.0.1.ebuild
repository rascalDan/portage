# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Check local haproxy functionality"
HOMEPAGE="https://exchange.nagios.org/directory/Plugins/Clustering-and-High-2DAvailability/check_haproxy_stats-2Epl/details"
SRC_URI="https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=4089&cf_id=24 -> ${P}.pl"

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
	exeinto /usr/lib/nagios/plugins/
	newexe ${S}/${A} ${PN}
}

