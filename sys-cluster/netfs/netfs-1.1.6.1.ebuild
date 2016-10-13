EAPI="5"

DESCRIPTION="Cluster capable network filesytem"
HOMEPAGE="http://netfs.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git-modules/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="client server systemd"

RDEPEND="dev-libs/Ice
	=dev-cpp/slicer-1.3*:=[xml]
	server? (
			sys-apps/icebox-service
		)
	>=dev-libs/libadhocutil-0.3.4:=
	client? (
			sys-fs/fuse
	   )
	dev-libs/boost"
DEPEND="${DEPEND}
	dev-util/boost-build"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/netfs || die
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release -q \
			$(use client && echo fuse//netfs) \
			$(use server && echo daemon//netfsd) \
			ice//netfsComms || die
}

src_install() {
	BJAM=`ls -1 /usr/bin/bjam* | tail -1`
	cd ${S}/netfs || die
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release -q \
			$(use client && echo fuse//install) \
			$(use server && echo daemon//install) \
			ice//install \
			--prefix=${D}/usr --includedir=${D}/usr/include/${PN}  || die

	if use client ; then
		insinto /etc/netfs || die
		doins ${S}/netfs/etc/client.xml || die
		dosym ../usr/bin/netfs /sbin/mount.netfs || die
	fi
	if use server ; then
		if use systemd ; then
			insinto /usr/lib/systemd/system/icebox@netfsd.service.d || die
			doins ${FILESDIR}/service.conf || die
		else
			newinitd ${S}/netfs/etc/init netfsd || die
		fi
		insinto /etc/netfs || die
		doins ${S}/netfs/etc/daemon.xml || die
		doins ${FILESDIR}/icebox.config || die
	fi
}
