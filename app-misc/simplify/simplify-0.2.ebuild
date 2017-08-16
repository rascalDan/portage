# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit bjam

DESCRIPTION="Simplify a list of files and folders."
HOMEPAGE="https://github.com/rascalDan/simplify"
SRC_URI="https://github.com/rascalDan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-libs/boost
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_compile() {
	bjambuild simplify
}

src_install() {
	bjaminstall install
}

