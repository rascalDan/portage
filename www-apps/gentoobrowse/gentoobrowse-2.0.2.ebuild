EAPI=5

inherit webapp depend.apache eutils bjam

DESCRIPTION="Gentoo Browse is an IceSpider based web site for viewing Gentoo content"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
HOMEPAGE="http://gentoobrowse.randomdan.homip.net/"

LICENSE="GPL"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="
	>=www-misc/icespider-0.2:=
	>=net-misc/gentoobrowse-api-0.9
"

pkg_setup() {
	webapp_pkg_setup
}

src_compile() {
	cd ${S}/${PN} || die
	bjambuild cgi || die
}

src_install () {
	cd ${S}/${PN} || die
	bjambuild install --bindir=${D}/${MY_CGIBINDIR} || die
	webapp_src_preinst

	insinto ${MY_HTDOCSDIR}
	doins -r config css img js xslt *.xml *.ico *.txt .htaccess || die
	dosym ${MY_CGIBINDIR}/gentoobrowse-cgi ${MY_HTDOCSDIR}/gentoobrowse-cgi

	webapp_src_install
}
