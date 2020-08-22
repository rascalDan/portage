EAPI="7"

inherit bjam

DESCRIPTION="Zeroc ICE slice parser as a standalone dynamic library"
HOMEPAGE="https://zeroc.com/products/ice"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz
	https://github.com/zeroc-ice/ice/archive/v${PV}.tar.gz -> Ice-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="=dev-libs/Ice-${PV}*"
DEPEND="${RDEPEND}
	dev-util/boost-build"

src_unpack() {
	default
	ln -s ${WORKDIR}/ice-${PV}/cpp ${S}/ice/cpp
}

src_compile() {
	bjambuild
}

src_install() {
	bjaminstall install \
		-i "Slice"
}

