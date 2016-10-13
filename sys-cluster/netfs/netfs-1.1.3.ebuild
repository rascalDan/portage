EAPI="5"

DESCRIPTION="Cluster capable network filesytem"
HOMEPAGE="http://netfs.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="dev-libs/Ice
	=dev-cpp/slicer-1.3*:=[xml]
	sys-fs/fuse
	dev-libs/boost
	dev-util/boost-build"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/netfs || die
	setarch $(uname -m) -RL ${BJAM} ${BJAMOPTS} variant=release fuse//netfs daemon//netfsd -q || die
}

src_install() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/netfs || die
	setarch $(uname -m) -RL ${BJAM} ${BJAMOPTS} variant=release install -q --bindir=${D}/usr/bin --libdir=${D}/usr/lib  || die
	insinto /usr/include/netfs || die
	doins ${S}/netfs/ice/*.h || die
	doins ${S}/netfs/ice/bin/*/*/*.h || die

	dosym ../usr/bin/netfs /sbin/mount.netfs || die

	newinitd ${S}/netfs/etc/init netfsd || die
	insinto /etc/netfs || die
	doins ${S}/netfs/etc/daemon.xml || die
	doins ${S}/netfs/etc/client.xml || die
	insinto /usr/share/netfs/ice || die
	doins ice/*.ice || die
}
