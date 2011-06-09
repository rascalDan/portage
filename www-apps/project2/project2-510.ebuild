inherit subversion

DESCRIPTION="User configured application engine"
HOMEPAGE="http://project2.randomdan.homeip.net"

EAPI="3"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="debug +docs odbc postgres +console +web +fastcgi"

DEPEND="
	dev-util/boost-build
	net-libs/libesmtp
	www-client/lynx
	dev-cpp/libxmlpp
	dev-cpp/glibmm
	>=dev-libs/boost-1.45
	odbc? ( dev-db/unixODBC )
	postgres? ( dev-db/postgresql-base )
	web? (
			www-apache/mod_transform
			fastcgi? (
				dev-libs/cgicc
				virtual/httpd-fastcgi
				dev-libs/fcgi
				)
		 )
	docs? ( app-doc/doxygen[cairo] )
	"
RDEPEND="${DEPEND}"
ESVN_REPO_URI="http://svn.randomdan.homeip.net/src/trunk"
ESVN_REVISION="${PV}"
BJAM=`ls -1 /usr/bin/bjam* | tail -1`
use !debug && var="variant=release"
use !odbc && odbc="odbc=no"
use !postgres && pq="pq=no"
use console && ( bt="$bt p2console" ; it="$it installp2con" )
use web && ( bt="$bt p2cgi" ; it="$it installp2cgi" )
use web && use fastcgi && ( bt="$bt p2fcgi" ; it="$it installp2fci" )

src_compile() {
	cd ${S}/project2 || die
	${BJAM} ${var} ${odbc} ${pq} ${bt} -q cflags="${CFLAGS}" linkflags="${LDFLAGS}" || die "Compile failed"
}

src_install() {
	cd ${S}/project2 || die
	${BJAM} ${var} ${odbc} ${pq} ${it} -q --bindir=${D}/usr/share/webapps/project2 --libdir=${D}/usr/lib \
			cflags="${CFLAGS}" linkflags="${LDFLAGS}" || die "Installed failed"
	mkdir -p ${D}/usr/share/doc/${P}
	if use docs ; then
		(cat Doxyfile ; echo OUTPUT_DIRECTORY=${D}/usr/share/doc/${P}) | doxygen - || die "Build docs failed"
	fi
}
