# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"
inherit bjam

DESCRIPTION="Simplify a list of files and folders."
HOMEPAGE="https://github.com/rascalDan/simplify"
SRC_URI="https://github.com/rascalDan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-libs/boost:=
"
DEPEND="
	${RDEPEND}
	dev-build/b2
"

src_compile() {
	bjambuild simplify simplifind
}

src_install() {
	bjaminstall install
}

