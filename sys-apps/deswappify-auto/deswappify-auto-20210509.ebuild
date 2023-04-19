# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{5..11} )
inherit python-single-r1 systemd

ID="edd256a886cdfcf04bab08559ba9e45464a59a20"
DESCRIPTION="Automatically fetch swapped pages to physical memory when enough memory is available"
HOMEPAGE="https://github.com/wiedemannc/deswappify-auto"
SRC_URI="https://github.com/wiedemannc/deswappify-auto/archive/$ID.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${PYTHON_DEPS}
	dev-python/python-systemd[${PYTHON_SINGLE_USEDEP}]
	dev-python/psutil[${PYTHON_SINGLE_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i 's|/usr/local/bin/|| ; /^#/d' deswappify.service
}

src_install() {
	python_doscript deswappify_auto.py
	systemd_dounit deswappify.service
}

S="${WORKDIR}/${PN}-${ID}"
