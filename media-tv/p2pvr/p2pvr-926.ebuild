EAPI=5

inherit user

DESCRIPTION="Project2 based lightweight PVR"
HOMEPAGE="http://p2pvr.randomdan.homeip.net"

SRC_URI="http://releases.randomdan.homeip.net/download/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x64"
IUSE=""

DEPEND="
	dev-util/boost-build
	>=dev-libs/Ice-3.5
	>=www-apps/project2-922[postgres,daemon]
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

pkg_preinst() {
	enewuser p2pvr -1 -1 /etc/p2pvr "video"
}

src_compile() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/p2pvr || die
	setarch $(uname -m) -RL \
		${BJAM} variant=release ${BJAMOPTS} -q \
		|| die "Compile failed"
}

src_install() {
	cd ${S}/p2pvr || die

	dodoc doc/* || die
	insinto /usr/share/p2pvr/ice || die
	doins ice/*.ice || die
	insinto /usr/share/p2pvr/sql || die
	doins datasources/schema.sql || die
	doinitd etc/init.d/* || die
	insinto /etc/p2pvr || die
	doins etc/p2config || die
	insinto /etc/p2pvr/datasources || die
	doins datasources/postgres.xml || die

	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	setarch $(uname -m) -RL \
		${BJAM} variant=release ${BJAMOPTS} -q install \
		--prefix=${D}/usr \
		|| die "Installed failed"
}