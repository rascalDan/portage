EAPI="5"

inherit eutils bjam

DESCRIPTION="Cluster capable network filesytem"
HOMEPAGE="http://netfs.randomdan.homeip.net/"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="client server"

RDEPEND="=dev-libs/Ice-3.7*
	>=dev-cpp/slicer-1.9:=[xml]
	server? (
			=sys-apps/icebox-service-1.11
		)
	>=dev-libs/libadhocutil-0.7:=
	client? (
			sys-fs/fuse
			>=dev-libs/boost-1.66:=
			)
	dev-libs/boost:="
DEPEND="${DEPEND}
	dev-util/boost-build"

src_compile() {
	bjambuild \
		$(use client && echo netfs/fuse//netfs) \
		$(use server && echo netfs/daemon//netfsd++11) \
		netfs/ice//netfs-api
}

src_install() {
	bjaminstall \
		$(use client && echo netfs/fuse//install) \
		$(use server && echo netfs/daemon//install) \
		netfs/ice//install

	if use client ; then
		insinto /etc/netfs
		doins netfs/etc/client.xml
		dosym ../usr/bin/netfs /sbin/mount.netfs
	fi
	if use server ; then
		insinto /etc/netfs
		doins netfs/etc/daemon.xml
		doins netfs/etc/icebox.config
	fi
}
