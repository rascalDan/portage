# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )

inherit distutils-r1

DESCRIPTION="MySQL to PostgreSQL replica system"
HOMEPAGE="https://pgchameleon.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/daemonize-2.4.7[${PYTHON_USEDEP}]
	>=dev-python/mysql-replication-0.15[${PYTHON_USEDEP}]
	>=dev-python/psycopg-2.8.3[${PYTHON_USEDEP}]
	<dev-python/pymysql-0.10[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1.2[${PYTHON_USEDEP}]
	>=dev-python/rollbar-0.13.17[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.1[${PYTHON_USEDEP}]"
BDEPEND=""
