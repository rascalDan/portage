# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9,10} )

SRC_URI="https://github.com/crmsh/crmsh/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~hppa ~x86"

inherit autotools distutils-r1

DESCRIPTION="Pacemaker command line interface for management and configuration"
HOMEPAGE="https://crmsh.github.io/"

LICENSE="GPL-2"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	>=sys-cluster/pacemaker-1.1.9"
RDEPEND="${DEPEND}
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/parallax[${PYTHON_USEDEP}]
"

src_prepare() {
	default

	eautoreconf
	distutils-r1_src_prepare
}

src_configure() {
	econf
	distutils-r1_src_configure
}

src_install() {
	distutils-r1_src_install
	emake DESTDIR="${D}" install-{data,info,man}
}
