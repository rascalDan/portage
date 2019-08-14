EAPI=6
inherit webapp depend.apache eutils bjam

DESCRIPTION="ICE and web service for locating files for download."
HOMEPAGE="https://git.randomdan.homeip.net/repo/mirrorsearch/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/pkgconfig
	>=www-misc/icespider-0.4:=
	dev-libs/icetray[tools]
	dev-libs/libdbpp-postgresql
	=sys-apps/icebox-service-1.11
"
RDEPEND="${DEPEND}"

pkg_setup() {
	webapp_pkg_setup
}

src_compile() {
	bjambuild service//mirrorsearch-service++11 site//mirrorsearch-cgi
}

src_install () {
	bjaminstall install{-bin,-site} \
		--bindir=${D}/${MY_CGIBINDIR} \
		--datarootdir=${D}/${MY_HTDOCSDIR}
	webapp_src_preinst
	dosym ${MY_CGIBINDIR}/mirrorsearch-cgi ${MY_HTDOCSDIR}/mirrorsearch-cgi
	webapp_src_install

	insinto /etc/${PN}
	doins service/icebox.config
}

