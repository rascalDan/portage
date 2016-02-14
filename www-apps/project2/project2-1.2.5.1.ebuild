EAPI="5"

DESCRIPTION="User configured application engine"
HOMEPAGE="http://project2.randomdan.homeip.net"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="+docs unittest +console +web +fastcgi +daemon"

RDEPEND="
	net-libs/libesmtp
	>=dev-libs/libadhocutil-0.2:=
	=dev-libs/libdbpp-1.0*:=
	www-client/lynx
	>=dev-cpp/libxmlpp-2.36
	sys-libs/zlib
	>=dev-cpp/glibmm-2.28
	>=dev-libs/boost-1.45
	>=dev-libs/Ice-3.5
	web? (
			fastcgi? (
				dev-libs/cgicc
				virtual/httpd-fastcgi
				dev-libs/fcgi
				)
		 )
	>=dev-cpp/slicer-1.3:=
	"

DEPEND="${RDEPEND}
	dev-util/boost-build
	sys-devel/flex
	docs? ( app-doc/doxygen )
"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_configure() {
	(
		echo "alias finalbin : "
		use console && echo " console//p2console "
		use web && echo " cgi//p2cgi "
		use web && use fastcgi && echo " cgi//p2fcgi "
		use daemon && echo " daemon//p2daemon "
		echo " ; "
		echo "alias finallib : "
		use unittest && echo " ut//p2ut "
		echo " ; "
	) >> ${S}/project2/Jamfile.jam
}

src_compile() {
	cd ${S}/project2 || die
	setarch $(uname -m) -RL \
			b2 ${BJAMOPTS} finalbin finallib -q \
			|| die "Compile failed"
}

src_install() {
	cd ${S}/project2 || die
	setarch $(uname -m) -RL \
			b2 ${BJAMOPTS} install -q \
			--bindir=${D}/usr/bin \
			--libdir=${D}/usr/lib \
			--includedir=${D}/usr/include/project2 \
			|| die "Installed failed"
	if use docs ; then
		mkdir -p ${D}/usr/share/doc/${PN}
		(cat Doxyfile ; echo OUTPUT_DIRECTORY=${D}/usr/share/doc/${PN}) | doxygen - || die "Build docs failed"
	fi
}
