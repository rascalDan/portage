inherit subversion

DESCRIPTION="User configured application engine"
HOMEPAGE="http://project2.randomdan.homeip.net"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug"

DEPEND="dev-db/unixODBC
	dev-cpp/libxmlpp
	dev-cpp/glibmm
	>=dev-libs/boost-1.42
	dev-libs/cgicc
	dev-util/boost-build
	virtual/httpd-fastcgi
	dev-libs/fcgi
	net-libs/libesmtp
	www-apache/mod_transform"
RDEPEND="${DEPEND}"
ESVN_REPO_URI="svn+ssh://svn.random.lan/var/svn/src/trunk"
BJAM=`ls -1 /usr/bin/bjam* | tail -1`
use !debug && var="variant=release"

src_compile() {
	cd ${S}/project2 || die
	${BJAM} ${var} -qj2 || die
}

src_install() {
	cd ${S}/project2 || die
	${BJAM} ${var} install -qj2 --bindir=${D}/usr/share/webapps/project2 --libdir=${D}/usr/lib || die
}
