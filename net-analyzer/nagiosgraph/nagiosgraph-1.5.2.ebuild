# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="nagiosgraph extracts information from the Nagios output and inserts it into RRD files"
HOMEPAGE="https://sourceforge.net/p/nagiosgraph"
SRC_URI="https://netix.dl.sourceforge.net/project/${PN}/${PN}/${PV}/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
dev-lang/perl
net-analyzer/rrdtool[perl]
dev-perl/GD
"
BDEPEND=""

src_configure() {
	sed -i "s|/opt/nagiosgraph/etc|/etc/${PN}|g" ${S}/cgi/*.cgi  ${S}/lib/*.pl
}

src_install() {
	insinto /etc/${PN}
	doins ${S}/etc/*
	exeinto /usr/$(get_libdir)/${PN}/bin
	doexe ${S}/lib/*.pl
	exeinto /usr/$(get_libdir)/${PN}/cgi-bin
	doexe ${S}/cgi/*.cgi
	insinto /usr/$(get_libdir)/${PN}/share
	doins ${S}/share/*
}
