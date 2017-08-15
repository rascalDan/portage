EAPI="5"
inherit bjam

DESCRIPTION="Lightweight native C++ JSON library"
HOMEPAGE="http://libjsonpp.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="dev-cpp/glibmm
	sys-devel/flex
	dev-libs/boost"
RDEPEND="${DEPEND}
	dev-util/boost-build"

src_compile() {
	bjambuild libjsonpp//jsonpp
}

src_install() {
	bjaminstall libjsonpp//install \
		-i ""
}

