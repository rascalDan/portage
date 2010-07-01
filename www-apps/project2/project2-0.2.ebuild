inherit subversion

DESCRIPTION="User configured application engine"
HOMEPAGE="http://project2.randomdan.homeip.net"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/unixODBC
	dev-cpp/libxmlpp
	dev-cpp/glibmm
	>=dev-libs/boost-1.42
	dev-libs/cgicc
	=dev-util/boost-build-1.42*
	virtual/httpd-fastcgi
	dev-libs/fcgi
	www-apache/mod_transform"
RDEPEND="${DEPEND}"
ESVN_REPO_URI="svn+ssh://svn.random.lan/var/svn/src/tags/${PF}"

src_compile() {
	cd ${S}/project2 || die
	bjam-1_42 variant=release || die
}

src_install() {
	exeinto /usr/share/webapps/project2
	doexe ${S}/project2/bin/*/release/p2web
}
