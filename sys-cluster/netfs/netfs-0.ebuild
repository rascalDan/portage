inherit subversion

EAPI=3

DESCRIPTION="Cluster capable network filesytem"
HOMEPAGE="http://netfs.randomdan.homeip.net/"
SRC_URI=""

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug"

DEPEND="dev-libs/Ice
	dev-cpp/libxmlpp
	dev-libs/boost
	dev-util/boost-build"
RDEPEND="${DEPEND}"

ESVN_REPO_URI="svn+ssh://svn.random.lan/var/svn/src/trunk"
BJAM=`ls -1 /usr/bin/bjam* | tail -1`
use !debug && var="variant=release"

src_compile() {
	cd ${S}/netfs || die
	${BJAM} ${var} -q || die
}

src_install() {
	cd ${S}/netfs || die
	${BJAM} ${var} install -qj2 --bindir=${D}/usr/sbin --libdir=${D}/usr/lib || die

	newinitd ${S}/netfs/etc/init netfsd || die
	insinto /etc/netfs || die
	doins ${S}/netfs/etc/daemon.xml || die
}
