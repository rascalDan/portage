EAPI="5"

DESCRIPTION="User configured application engine"
HOMEPAGE="http://project2.randomdan.homeip.net"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="debug +docs mysql odbc postgres +console +web +fastcgi +daemon"

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
use !debug && var="variant=release"
use !odbc && odbc="odbc=no"
use !mysql && mysql="mysql=no"
use !postgres && pq="pq=no"
use console && bt="$bt p2console" && it="$it installp2con"
use web && bt="$bt p2cgi" && it="$it installp2cgi"
use web && use fastcgi && bt="$bt p2fcgi" && it="$it installp2fcgi"
use daemon && bt="$bt p2daemon" && it="$it installp2daemon"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/project2 || die
	setarch $(uname -m) -RL \
			b2 ${BJAMOPTS} ${var} ${odbc} ${mysql} ${pq} ${bt} -q \
			|| die "Compile failed"
}

src_install() {
	cd ${S}/project2 || die
	setarch $(uname -m) -RL \
			b2 ${BJAMOPTS} ${var} ${odbc} ${mysql} ${pq} ${it} -q \
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
