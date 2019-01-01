# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Version controlled file system"
HOMEPAGE="https://www.presslabs.com/code/gitfs/"
SRC_URI="https://github.com/presslabs/gitfs/archive/0.4.5.1.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
=dev-libs/libgit2-0.27*
"
RDEPEND="${DEPEND}"
BDEPEND="
dev-python/virtualenv
"
PATCHES="
$FILESDIR/python36.patch
$FILESDIR/requirements.patch
"

addpredict "/usr/lib/python3.6/site-packages/pycparser/__pycache__/"

src_install() {
	emake install PREFIX="/usr" DESTDIR="${D}"
	keepdir "/var/lib/${PN}"
}

