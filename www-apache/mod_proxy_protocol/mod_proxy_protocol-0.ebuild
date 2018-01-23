# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit apache-module eutils

DESCRIPTION="An implementation of the proxy protocol for Apache."
HOMEPAGE="https://github.com/roadrunner2/mod-proxy-protocol"

SRC_URI="https://api.github.com/repos/roadrunner2/mod-proxy-protocol/tarball/84d3f3b3b57a598d109554857f27792deefac6f8 -> ${P}.tar.gz"

KEYWORDS="~amd64 ~ppc ~x86"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="sys-devel/libtool"
RDEPEND=""

need_apache2

S="${WORKDIR}/roadrunner2-mod-proxy-protocol-84d3f3b"

