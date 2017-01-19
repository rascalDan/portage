EAPI=5

inherit webapp depend.apache eutils

DESCRIPTION="Gentoo Browse is an IceSpider based web site for viewing Gentoo content"
SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
HOMEPAGE="http://gentoobrowse.randomdan.homip.net/"

LICENSE="GPL"
KEYWORDS="~amd64 ~x86"

IUSE=""

DEPEND="
	www-misc/icespider
	net-misc/gentoobrowse-api[client]
"

pkg_setup() {
	webapp_pkg_setup
}

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/${PN} || die
	b2 -q ${BJAMOPTS} variant=release cgi || die
}

src_install () {
	cd ${S}/${PN} || die
	b2 -q ${BJAMOPTS} variant=release install --bindir=${D}/${MY_CGIBINDIR} || die
	webapp_src_preinst

	insinto ${MY_HTDOCSDIR}
	doins -r config css img js xslt *.xml *.ico *.txt .htaccess || die
	dosym ${MY_CGIBINDIR}/gentoobrowse-cgi ${MY_HTDOCSDIR}/gentoobrowse-cgi

	webapp_src_install
}
