EAPI="5"
inherit systemd eutils bjam

DESCRIPTION="ICE API and client for Gentoo Browse"
HOMEPAGE="http://gentoobrowse.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="client server"

RDEPEND="dev-libs/Ice
	server? (
		=dev-cpp/slicer-1.4*:=[db]
		sys-apps/icebox-service
		>=dev-libs/libdbpp-1:=
		>=dev-libs/libdbpp-postgresql-1.1.2
		>=dev-libs/icetray-0.1.4[tools]
		>=dev-libs/boost-1.60
		>=dev-libs/libgit2-0.24.0
	)
	>=dev-libs/libadhocutil-0.3.6:=
	dev-libs/boost"
DEPEND="${DEPEND}
	sys-devel/flex
	dev-util/boost-build"

src_compile() {
	cd ${S}/gentoobrowse-api || die
	bjambuild \
		api//gentoobrowse-api \
		domain//gentoobrowse-domain \
		$(use client && echo client//gbcli) \
		$(use server && echo service//gentoobrowse-service util) || die
}

src_install() {
	cd ${S}/gentoobrowse-api || die
	bjambuild --prefix=${D}/usr \
		--includedir=${D}/usr/include/${PN} \
		install-libs \
		install-slice \
		$(use client && echo install-client) \
		$(use server && echo install-service) || die
	if use server ; then
		insinto /etc/gentoobrowseapi || die
		doins etc/icebox.config || die
		insinto $(systemd_get_systemunitdir)/icebox@gentoobrowseapi.service.d || die
		doins etc/service.conf || die
	fi
}

