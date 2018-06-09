EAPI="5"

inherit bjam

DESCRIPTION="Ad-hoc collection of utility functions, classes, helpers"
HOMEPAGE="http://docs.randomdan.homeip.net/libadhocutil"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/0.4.3"
KEYWORDS="x86 amd64"
IUSE="man test"

RDEPEND="
	net-misc/curl
	=dev-libs/Ice-3.6*
	dev-libs/boost:=
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

	insinto /usr/include/adhocutil || die
	doins libadhocutil/bin/*/*/*.h || die
	insinto /usr/share/adhocutil/ice || die
	doins libadhocutil/*.ice || die

	if use man ; then
		doxygenbuild
	fi
}

