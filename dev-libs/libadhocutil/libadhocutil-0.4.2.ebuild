EAPI="5"

inherit bjam

DESCRIPTION="Ad-hoc collection of utility functions, classes, helpers"
HOMEPAGE="http://libadhocutil.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/0.3.4"
KEYWORDS="x86 amd64"
IUSE="man test"

RDEPEND="
	net-misc/curl
	dev-libs/Ice
	dev-libs/boost
	dev-cpp/glibmm
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	dev-util/boost-build
	man? ( app-doc/doxygen )
"

src_compile() {
	cd ${S}/libadhocutil || die
	bjambuild variant=release adhocutil -q || die
}

src_install() {
	cd ${S}/libadhocutil || die

	bjambuild variant=release install -q \
		--libdir=${D}/usr/lib \
		--includedir=${D}/usr/include/adhocutil || die

	insinto /usr/include/adhocutil || die
	doins ${S}/libadhocutil/bin/*/*/*.h || die
	insinto /usr/share/adhocutil/ice || die
	doins *.ice || die

	if use man ; then
		mkdir -p ${D}/usr/share/man
		(cat Doxyfile ;
			echo OUTPUT_DIRECTORY=${D}/usr/share
			echo PROJECT_NUMBER=${PV}
		) | tee ${T}/doxy | doxygen - || die "Build docs failed"
	fi
}

src_test() {
	cd ${S}/libadhocutil || die
	bjambuild variant=release -q || die
}

