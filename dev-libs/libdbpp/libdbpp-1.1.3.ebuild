EAPI="5"

inherit bjam eutils

DESCRIPTION="C++ database connectivity common components"
HOMEPAGE="http://libdbpp.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0/7"
KEYWORDS="~x86 ~amd64"
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
	cd ${S}/libdbpp || die
	bjambuild \
		variant=release dbppcore $(use ut && echo dbpptestcore) -q || die
}

src_install() {
	cd ${S}/libdbpp || die

	bjambuild \
		variant=release install $(use ut && echo installtest) -q \
		--libdir=${D}/usr/lib \
		--bindir=${D}/usr/bin \
		--includedir=${D}/usr/include/dbpp || die

	if use man ; then
		mkdir -p ${D}/usr/share/man
		(cat Doxyfile ;
			echo OUTPUT_DIRECTORY=${D}/usr/share
			echo PROJECT_NUMBER=${PV}
		) | tee /var/tmp/doxy | doxygen - || die "Build docs failed"
	fi
}

