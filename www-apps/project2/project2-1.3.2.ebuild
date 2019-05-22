EAPI="5"
inherit bjam

DESCRIPTION="User configured application engine"
HOMEPAGE="http://project2.randomdan.homeip.net"

ICE_VERSION=3.7.1
SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz
	https://github.com/zeroc-ice/ice/archive/v${ICE_VERSION}.tar.gz -> Ice-${ICE_VERSION}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="+docs unittest +console +web +fastcgi +daemon"

RDEPEND="
	net-libs/libesmtp
	=dev-libs/libadhocutil-0.6*:=
	=dev-libs/libdbpp-1*:=
	www-client/lynx
	dev-cpp/libxmlpp:3.0
	sys-libs/zlib
	>=dev-cpp/libjsonpp-0.11
	>=dev-cpp/glibmm-2.28
	>=dev-libs/boost-1.45:=
	=dev-libs/Ice-3.7*
	web? (
			fastcgi? (
				dev-libs/cgicc
				virtual/httpd-fastcgi
				dev-libs/fcgi
				)
		 )
	>=dev-cpp/slicer-1.8:=
	"

DEPEND="${RDEPEND}
	dev-util/boost-build
	sys-devel/flex
	docs? ( app-doc/doxygen )
"
src_unpack() {
	default
	ln -s ${WORKDIR}/ice-${ICE_VERSION}/cpp ${S}/ice/cpp
}

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
	bjambuild project2//finalbin project2//finallib
}

src_install() {
	bjaminstall project2//install \
		-i project2
	if use docs ; then
		mkdir -p ${D}/usr/share/doc/${PN}
		(cat Doxyfile ; echo OUTPUT_DIRECTORY=${D}/usr/share/doc/${PN}) | doxygen - || die "Build docs failed"
	fi
}
