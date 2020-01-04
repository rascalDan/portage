# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation."
HOMEPAGE="https://github.com/pangloss/vim-javascript"
LICENSE="vim"
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="https://github.com/pangloss/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

VIM_PLUGIN_HELPFILES=""
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

