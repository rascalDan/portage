EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

SRC_URI="https://github.com/crmsh/crmsh/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~hppa ~x86"

inherit autotools python-single-r1

DESCRIPTION="Pacemaker command line interface for management and configuration"
HOMEPAGE="https://crmsh.github.io/"

LICENSE="GPL-2"
SLOT="0"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}
	>=sys-cluster/pacemaker-2.1.2"
RDEPEND="${DEPEND}
	$(python_gen_cond_dep '
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/parallax[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	default

	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install
	python_fix_shebang "${ED}"
	python_optimize
}
