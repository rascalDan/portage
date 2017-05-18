EAPI="5"

inherit eutils bjam

DESCRIPTION="Cluster capable network filesytem"
HOMEPAGE="http://netfs.randomdan.homeip.net/"

SRC_URI="http://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="client server systemd"

RDEPEND="dev-libs/Ice
	=dev-cpp/slicer-1.4*:=[xml]
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

src_compile() {
	cd ${S}/netfs || die
	bjambuild \
			$(use client && echo fuse//netfs) \
			$(use server && echo daemon//netfsd) \
			ice//netfsComms || die
}

src_install() {
	cd ${S}/netfs || die
	bjambuild \
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
