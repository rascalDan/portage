EAPI="3"
inherit subversion

DESCRIPTION="Cluster capable network filesytem"
HOMEPAGE="http://netfs.randomdan.homeip.net/"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="debug"

DEPEND="dev-libs/Ice
	dev-cpp/libxmlpp
	dev-libs/boost
	dev-util/boost-build"
RDEPEND="${DEPEND}"
ESVN_REPO_URI="http://svn.randomdan.homeip.net/src/trunk"
ESVN_REVISION="${PV}"
use !debug && var="variant=release"

src_compile() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/netfs || die
	setarch $(uname -m) -RL \
		${BJAM} ${var} -q cflags="${CFLAGS}" linkflags="${LDFLAGS}" || die
}

src_install() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/netfs || die
	setarch $(uname -m) -RL \
		${BJAM} ${var} install -qj2 --bindir=${D}/usr/sbin --libdir=${D}/usr/lib \
				cflags="${CFLAGS}" linkflags="${LDFLAGS}" || die

	dosym /usr/sbin/netfs /sbin/mount.netfs || die

	newinitd ${S}/netfs/etc/init netfsd || die
	insinto /etc/netfs || die
	doins ${S}/netfs/etc/daemon.xml || die
	doins ${S}/netfs/client.xml || die
}
