EAPI="6"
inherit bjam

DESCRIPTION="Lightweight native C++ JSON library"
HOMEPAGE="http://libjsonpp.randomdan.homeip.net/"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-cpp/glibmm
	dev-libs/boost"
RDEPEND="${DEPEND}
	sys-devel/flex
	dev-util/boost-build"

src_compile() {
	bjambuild libjsonpp//jsonpp
}

src_install() {
	bjaminstall libjsonpp//install \
		-i ""
}

