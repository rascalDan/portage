EAPI="5"
inherit systemd eutils bjam

DESCRIPTION="ICE API and client for Gentoo Browse"
HOMEPAGE="http://gentoobrowse.randomdan.homeip.net/"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="client server"

RDEPEND="dev-libs/Ice
	server? (
		=dev-cpp/slicer-1.5*:=[db]
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
	bjambuild \
		gentoobrowse-api/api//gentoobrowse-api \
		gentoobrowse-api/domain//gentoobrowse-domain \
		$(use client && echo gentoobrowse-api/client//gbcli) \
		$(use server && echo \
				gentoobrowse-api/service//gentoobrowse-service \
				gentoobrowse-api/util)
}

src_install() {
	bjaminstall \
		gentoobrowse-api//install-libs \
		gentoobrowse-api//install-slice \
		$(use client && echo gentoobrowse-api//install-client) \
		$(use server && echo gentoobrowse-api//install-service)
	if use server ; then
		insinto /etc/gentoobrowseapi || die
		doins gentoobrowse-api/etc/icebox.config || die
		insinto $(systemd_get_systemunitdir)/icebox@gentoobrowseapi.service.d || die
		doins gentoobrowse-api/etc/service.conf || die
	fi
}

