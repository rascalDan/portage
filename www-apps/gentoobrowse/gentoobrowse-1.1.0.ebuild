EAPI=5

inherit webapp depend.apache eutils

DESCRIPTION="Gentoo Browse is a Project2 based web site for viewing Gentoo packages"
SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
HOMEPAGE="http://gentoobrowse.randomdan.homip.net/"

LICENSE="GPL"
KEYWORDS="amd64 x86"

IUSE=""

DEPEND="www-apps/project2[fastcgi,postgres]"

pkg_setup() {
	webapp_pkg_setup
}

src_compile() {
	cd ${S}/gentoobrowse
	ln -s /usr/bin/p2fcgi || die
}
src_install () {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	cd ${S}/gentoobrowse
	doins -r . || die

	webapp_src_install
}
