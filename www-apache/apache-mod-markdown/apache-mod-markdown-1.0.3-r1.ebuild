# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit apache-module autotools

DESCRIPTION="mod_markdown is Markdown filter module for Apache HTTPD Server."
HOMEPAGE="https://github.com/hamano/apache-mod-markdown"
SRC_URI="https://github.com/hamano/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="=app-text/discount-2*"
RDEPEND="${DEPEND}"
BDEPEND=""

need_apache2

src_prepare() {
	eautoreconf
	default
}

src_configure() {
	econf --with-apxs="${APXS}" --with-discount="/usr"
}

src_compile() {
	emake
}

src_install() {
	emake install DESTDIR="${D}"
}

