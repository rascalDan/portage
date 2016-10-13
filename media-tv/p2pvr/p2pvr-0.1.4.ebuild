EAPI=5

inherit user

DESCRIPTION="Project2 based lightweight PVR"
HOMEPAGE="http://p2pvr.randomdan.homeip.net"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x64"
IUSE=""

RDEPEND="
	=dev-cpp/slicer-1.3*:=[db]
	>=dev-libs/Ice-3.5
	>=www-apps/project2-1.2[daemon]
	dev-libs/libdbpp-postgresql
"
DEPEND="${RDEPEND}
	dev-util/boost-build"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

pkg_preinst() {
	enewuser p2pvr -1 -1 /etc/p2pvr "video"
}

src_compile() {
	cd ${S}/p2pvr || die
	setarch $(uname -m) -RL \
		b2 variant=release ${BJAMOPTS} -q finallib \
		|| die "Compile failed"
}

src_install() {
	cd ${S}/p2pvr || die

	dodoc doc/* || die
	insinto /usr/share/p2pvr/ice || die
	doins ice/*.ice || die
	insinto /usr/share/p2pvr/sql || die
	doins datasources/schema.sql || die
	insinto /usr/lib/systemd/system || die
	doins etc/systemd/* || die
	doinitd etc/init.d/* || die
	insinto /etc/p2pvr || die
	doins etc/p2config || die
	insinto /etc/p2pvr/datasources || die
	doins datasources/postgres.xml || die

	setarch $(uname -m) -RL \
		b2 variant=release ${BJAMOPTS} -q install \
		--prefix=${D}/usr \
		|| die "Install failed"
}

