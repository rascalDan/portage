# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="Roboto Mono is a monospaced addition to the Roboto type family."
HOMEPAGE="https://github.com/googlefonts/RobotoMono"
SRC_URI="https://fonts.google.com/download?family=Roboto%20Mono -> ${P}.zip"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 ~ppc64 x86 ~amd64-linux ~x86-linux ~x64-macos"

BDEPEND="app-arch/unzip"

FONT_CONF=( "${FILESDIR}"/90-robotomono-regular.conf )
FONT_SUFFIX="ttf"
