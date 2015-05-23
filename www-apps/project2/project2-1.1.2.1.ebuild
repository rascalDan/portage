EAPI="5"

DESCRIPTION="User configured application engine"
HOMEPAGE="http://project2.randomdan.homeip.net"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="debug +docs mysql odbc postgres sqlite unittest +console +web +fastcgi +daemon"

DEPEND="
	dev-util/boost-build
	net-libs/libesmtp
	www-client/lynx
	>=dev-cpp/libxmlpp-2.36
	sys-libs/zlib
	>=sys-devel/gcc-4.5
	>=dev-cpp/glibmm-2.28
	>=dev-libs/boost-1.45
	>=dev-libs/Ice-3.5
	mysql? ( virtual/mysql )
	odbc? ( dev-db/unixODBC )
	postgres? ( dev-db/postgresql )
	sqlite? ( dev-db/sqlite )
	web? (
			fastcgi? (
				dev-libs/cgicc
				virtual/httpd-fastcgi
				dev-libs/fcgi
				)
		 )
	docs? ( app-doc/doxygen )
	dev-cpp/slicer:=
	"
RDEPEND="${DEPEND}"
use !debug && opts+=" variant=release"
use !odbc && opts+=" odbc=no"
use !mysql && opts+=" mysql=no"
use !postgres && opts+=" pq=no"
use !sqlite && opts+=" sqlite=no"

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
			b2 ${BJAMOPTS} ${opts} finalbin finallib -q \
			|| die "Compile failed"
}

src_install() {
	cd ${S}/project2 || die
	setarch $(uname -m) -RL \
			b2 ${BJAMOPTS} ${opts} install -q \
			--prefix=${D}/usr \
			|| die "Installed failed"
	b2 installheaders --includedir=${D}/usr/include/project2 || die "Install headers failed"
	b2 installheadersmisc --includedir=${D}/usr/include/project2/lib || die "Install headers failed"
	b2 installheadersdb --includedir=${D}/usr/include/project2/sql || die "Install headers failed"
	if use docs ; then
		mkdir -p ${D}/usr/share/doc/${PN}
		(cat Doxyfile ; echo OUTPUT_DIRECTORY=${D}/usr/share/doc/${PN}) | doxygen - || die "Build docs failed"
	fi
}
