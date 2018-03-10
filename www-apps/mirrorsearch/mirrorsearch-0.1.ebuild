EAPI=6
inherit webapp depend.apache eutils bjam

DESCRIPTION="ICE and web service for locating files for download."
HOMEPAGE="https://git.randomdan.homeip.net/repo/mirrorsearch/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"

LICENSE="GPL"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=www-misc/icespider-0.2:=
	dev-libs/icetray[tools]
	dev-libs/libdbpp-postgresql
"
RDEPEND="${DEPEND}"

pkg_setup() {
	webapp_pkg_setup
}

src_compile() {
	bjambuild service//mirrorsearch-service site//mirrorsearch-cgi
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

