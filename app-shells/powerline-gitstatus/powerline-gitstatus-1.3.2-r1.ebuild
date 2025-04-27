# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..12} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="powerline-gitstatus"
inherit distutils-r1

DESCRIPTION="A Powerline segment for showing the status of a Git working copy."
HOMEPAGE="https://github.com/jaspernbrouwer/powerline-gitstatus"
SRC_URI="https://github.com/jaspernbrouwer/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-shells/powerline"
RDEPEND="${DEPEND}"
BDEPEND=""
