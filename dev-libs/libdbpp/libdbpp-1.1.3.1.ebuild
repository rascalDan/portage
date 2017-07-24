EAPI="5"

inherit bjam eutils

DESCRIPTION="C++ database connectivity common components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/7"
KEYWORDS="x86 amd64"
IUSE="man ut"

RDEPEND="
	dev-libs/boost
	>=dev-libs/libadhocutil-0.4.1:=
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	dev-util/boost-build
	man? ( app-doc/doxygen )
"

src_compile() {
	bjambuild \
		libdbpp//dbppcore $(use ut && echo libdbpp//dbpptestcore libdbpp//createmockdb) -q || die
}

src_install() {
	bjambuild \
		libdbpp//install $(use ut && echo libdbpp//installtest) -q \
		--libdir=${D}/usr/lib \
		--bindir=${D}/usr/bin \
		--includedir=${D}/usr/include/dbpp || die

	if use man ; then
		doxygenbuild
	fi
}
