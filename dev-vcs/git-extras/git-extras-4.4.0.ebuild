# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
HOMEPAGE="https://github.com/tj/git-extras"
SRC_URI="https://github.com/tj/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/bd0548737599366c53fa78404b626616559c4556.patch"
}

