# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Binaryen is a compiler and toolchain infrastructure library for WebAssembly"
HOMEPAGE="https://github.com/WebAssembly/binaryen"
SRC_URI="https://github.com/WebAssembly/${PN}/archive/refs/tags/version_${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-version_${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure()
{
	local mycmakeargs=("-DBUILD_TESTS=OFF"
			"-DENABLE_WERROR=OFF")
	cmake_src_configure
}
