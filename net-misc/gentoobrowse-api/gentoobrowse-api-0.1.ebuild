EAPI="5"

DESCRIPTION="ICE API and client for Gentoo Browse"
HOMEPAGE="http://gentoobrowse.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="client service"

RDEPEND="dev-libs/Ice
	service? (
		>=dev-cpp/slicer-1.2:=[db]
		sys-apps/icebox-service
		dev-libs/libdbpp-postgresql
	)
	dev-cpp/slicer
	>=dev-libs/libadhocutil-0.3
	dev-libs/boost"
DEPEND="${DEPEND}
	dev-util/boost-build"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/gentoobrowse-api || die
	setarch $(uname -m) -RL b2 -q ${BJAMOPTS} variant=release \
		domain//gentoobrowse-domain \
		$(use client && echo client//gbcli) \
		$(use service && echo service//gentoobrowse-service) || die
}

src_install() {
	cd ${S}/gentoobrowse-api || die
	setarch $(uname -m) -RL b2 -q ${BJAMOPTS} variant=release --prefix=${D}/usr \
		install-libs \
		install-slice \
		$(use client && echo install-client) \
		$(use service && echo install-service) || die
	insinto /etc/gentoobrowseapi || die
	doins etc/icebox.config || die
}

