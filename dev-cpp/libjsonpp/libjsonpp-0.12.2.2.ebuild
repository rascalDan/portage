EAPI="7"
inherit bjam

DESCRIPTION="Lightweight native C++ JSON library"
HOMEPAGE="http://libjsonpp.randomdan.homeip.net/"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-cpp/glibmm"
RDEPEND="${DEPEND}
	sys-devel/flex
	dev-build/b2"

src_compile() {
	bjambuild libjsonpp//jsonpp
}

src_install() {
	bjaminstall libjsonpp//install \
		-i ""
}

