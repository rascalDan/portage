EAPI="7"

inherit bjam

DESCRIPTION="Ad-hoc collection of utility functions, classes, helpers"
HOMEPAGE="http://docs.randomdan.homeip.net/libadhocutil"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0/0.9.1"
KEYWORDS="x86 amd64"
IUSE="man test"

RDEPEND="
	net-misc/curl
	=dev-libs/Ice-3.7*
	dev-cpp/glibmm:2.68
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	dev-build/b2
	virtual/pkgconfig
	man? ( app-text/doxygen )
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

