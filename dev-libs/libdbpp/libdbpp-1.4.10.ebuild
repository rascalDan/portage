EAPI="7"

inherit bjam

DESCRIPTION="C++ database connectivity common components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0/1.4.10"
KEYWORDS="~x86 ~amd64"
IUSE="man ut"

RDEPEND="
	dev-libs/boost:=
	>=dev-libs/libadhocutil-0.9.3:=
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	dev-build/b2
	virtual/pkgconfig
	dev-cpp/glibmm:2.68
	man? ( app-text/doxygen )
"

src_compile() {
	bjambuild \
		libdbpp//dbppcore $(use ut && echo libdbpp//dbpptestcore libdbpp//createmockdb)
}

src_install() {
	bjaminstall \
		libdbpp//install $(use ut && echo libdbpp//installtest) \
		-i dbpp

	if use man ; then
		doxygenbuild
	fi
}

