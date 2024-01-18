EAPI="7"

inherit bjam unpacker

DESCRIPTION="Zeroc ICE slice parser as a standalone dynamic library"
HOMEPAGE="https://zeroc.com/products/ice"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz
	https://github.com/zeroc-ice/ice/archive/v${PV}.tar.gz -> Ice-${PV}.tar.gz"
LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~x86 ~amd64"

RDEPEND="=dev-libs/Ice-${PV}*"
DEPEND="${RDEPEND}
	dev-build/b2"

src_unpack() {
	unpack ${P}.tar.xz
	unpack_banner Ice-${P}.tar.xz
	tar -xzf ${DISTDIR}/Ice-${PV}.tar.gz -C "${S}"/ice --strip-components=1 ice-${PV}/cpp || die
}

src_compile() {
	bjambuild
}

src_install() {
	bjaminstall install \
		-i "Slice"
}

