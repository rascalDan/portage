# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Checks the status of a Pacemaker based Cluster using crm_mon"
HOMEPAGE="https://exchange.nagios.org/directory/Plugins/Clustering-and-High-2DAvailability/Check-CRM/details"
SRC_URI="https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=2403&cf_id=30 -> ${P}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-lang/perl-5.8
dev-perl/Monitoring-Plugin"
BDEPEND=""
PATCHES="${FILESDIR}/monitoring-plugin.patch"

src_unpack() {
	mkdir -p ${S}
	cp ${DISTDIR}/${A} ${S}
}
src_install() {
	exeinto /usr/$(get_libdir)/nagios/plugins/
	newexe ${S}/${A} ${PN}
}

