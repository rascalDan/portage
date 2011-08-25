# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="SQuirreL SQL Client is a graphical Java program that will allow you to view the structure of a JDBC compliant database, browse the data in tables, issue SQL commands etc"
HOMEPAGE="http://www.squirrelsql.org/"
SRC_URI="http://heanet.dl.sourceforge.net/project/squirrel-sql/1-stable/${PV}-plainzip/${P}-optional.tar.gz"

LICENSE="lgpl"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/jre"
RDEPEND="${DEPEND}"

src_install() {
	mkdir -p ${D}/opt/${PN} || die "Create install dir"
	cp -R ${WORKDIR}/${P}-optional/* ${D}/opt/${PN}
}
