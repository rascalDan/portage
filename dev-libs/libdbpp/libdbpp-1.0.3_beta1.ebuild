EAPI="5"

DESCRIPTION="C++ database connectivity common components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0/3"
KEYWORDS="x86 amd64"
IUSE="man ut"

RDEPEND="
	dev-libs/boost
	>=dev-libs/libadhocutil-0.3.2:=
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
	cd ${S}/libdbpp || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release dbppcore $(use ut && echo dbpptestcore) -q || die
}

src_install() {
	cd ${S}/libdbpp || die

	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install $(use ut && echo installtest) -q \
		--libdir=${D}/usr/lib \
		--includedir=${D}/usr/include/dbpp || die

	if use man ; then
		mkdir -p ${D}/usr/share/man
		(cat Doxyfile ;
			echo OUTPUT_DIRECTORY=${D}/usr/share
			echo PROJECT_NUMBER=${PV}
		) | tee /var/tmp/doxy | doxygen - || die "Build docs failed"
	fi
}

