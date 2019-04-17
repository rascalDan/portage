EAPI="5"

inherit bjam

DESCRIPTION="Ad-hoc collection of utility functions, classes, helpers"
HOMEPAGE="http://docs.randomdan.homeip.net/libadhocutil"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/0.7.2"
KEYWORDS="~x86 ~amd64"
IUSE="man test"

RDEPEND="
	net-misc/curl
	=dev-libs/Ice-3.7*
	dev-cpp/glibmm
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	dev-util/boost-build
	man? ( app-doc/doxygen )
"

src_compile() {
	bjambuild libadhocutil//adhocutil
}

src_install() {
	bjaminstall libadhocutil//install \
		-i adhocutil

	if use man ; then
		doxygenbuild
	fi
}

