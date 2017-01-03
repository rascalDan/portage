# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Simplify a list of files and folders.￼Edit"
HOMEPAGE="https://github.com/rascalDan/simplify"
SRC_URI="https://github.com/rascalDan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/boost
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
	eapply_user
}

src_compile() {
	b2 ${BJAMOPTS} variant=release simplify -q || die
}

src_install() {
	b2 ${BJAMOPTS} variant=release install -q --prefix=${D}/usr || die
}

