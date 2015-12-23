EAPI="5"

DESCRIPTION="Ad-hoc collection of utility functions, classes, helpers"
HOMEPAGE="http://libadhocutil.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0/0"
KEYWORDS="x86 amd64"
IUSE="man test"

RDEPEND="
	net-misc/curl
	dev-libs/Ice
	dev-libs/boost
"
DEPEND="
	${RDEPEND}
	sys-devel/flex
	dev-util/boost-build
	man? ( app-doc/doxygen )
"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/libadhocutil || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release adhocutil -q || die
}

src_install() {
	cd ${S}/libadhocutil || die

	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install -q \
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
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release -q || die
}

