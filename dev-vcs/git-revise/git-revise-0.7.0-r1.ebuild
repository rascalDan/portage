EAPI=8
PYTHON_COMPAT=(python3_{10..13})
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="git revise is a git subcommand to update, split, and rearrange commits."
HOMEPAGE="https://github.com/mystor/git-revise"
SRC_URI="https://github.com/mystor/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
