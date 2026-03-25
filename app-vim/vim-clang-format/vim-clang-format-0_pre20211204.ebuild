# Copyright 2020-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

COMMIT_HASH="6b791825ff478061ad1c57b21bb1ed5a5fd0eb29"
DESCRIPTION="Vim plugin for clang-format"
HOMEPAGE="https://github.com/rhysd/vim-clang-format"
SRC_URI="https://github.com/rhysd/${PN}/archive/${COMMIT_HASH}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT_HASH}"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"

RDEPEND="llvm-core/clang"

src_prepare() {
	default

	# tests are written in ruby, prefer to avoid that
	rm -r test || die
}
