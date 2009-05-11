# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvs/lportage/net-fs/glusterfs/glusterfs-2.0.0_rc7.ebuild,v 1.1 2009-05-11 19:58:56 randomdan Exp $

EAPI="2"

inherit autotools eutils versionator

DESCRIPTION="GlusterFS is a powerful network/cluster filesystem"
HOMEPAGE="http://www.gluster.org/"

SLOT="0"
MY_PV="$(replace_version_separator '_' '')"
MY_PV_2="$(get_version_component_range "1-2")"
MY_PV_3="$(get_version_component_range "1-3")"
MY_P="${PN}-${MY_PV}"
SRC_URI="http://europe.gluster.org/${PN}/${MY_PV_2}/${MY_PV_3}/${MY_P}.tar.gz"
LICENSE="GPL-3"

KEYWORDS="~amd64 ~ppc ~ppc64"
IUSE="berkdb doc examples fuse -apache2 -infiniband"

#	Currently in @system
#	kernel_FreeBSD?	( sys-freebsd/freebsd-libexec )

COMMON_DEPEND="
	berkdb?		( >=sys-libs/db-4.6.21 )
	fuse?		( >=sys-fs/fuse-2.7.0 )
	apache2?	( >=www-servers/apache-2.2 )
	infiniband?	( sys-cluster/libibverbs )
"
# Currently in @system
#	sys-devel/bison
#	sys-devel/flex
DEPEND="${COMMON_DEPEND}"
# Disabled
RDEPEND="${COMMON_DEPEND}"

RESTRICT="mirror"
S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-2.0.0_rc7-docdir.patch"
	#epatch "${FILESDIR}/${PN}-2.0.0_rc1-run-and-log-directories.patch"

	if ! use doc; then
		ebegin "Applying sed remove-guides-from-Makefile.am-patch"
		sed -i -e '/SUBDIRS =/s/ [a-z]*\-guide//g' \
		doc/Makefile.am \
		|| die "sed remove-guides-from-Makefile.am-patch"
		eend 0
	fi

	if ! use examples; then
		ebegin "Applying sed remove-examples-from-Makefile.am-patch"
		sed -i -e '/SUBDIRS =/s/ examples//' \
		doc/Makefile.am \
		|| die "sed remove-examples-from-Makefile.am-patch"
		eend 0
	fi

	eautoreconf || die "eautoreconf failed"
}

src_configure() {
	local myconf="
		$(use_enable berkdb bdb)
		$(use_enable fuse fuse-client)
		$(use_enable fuse libglusterfsclient)
		$(use_enable apache2 mod_glusterfs)
		$(use_enable infiniband ibverbs)
	"

	econf --config-cache --disable-static ${myconf} \
	--localstatedir=/var --docdir=/usr/share/doc/${PF}
}

src_compile() {
	# Parallel make workaround
	cd "${S}/libglusterfs" && emake -j1 || die "emake failed"
	cd "${S}" && emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" LIBTOOLFLAGS="--quiet" -j1 install || die "emake install failed"

	dodoc AUTHORS ChangeLog NEWS README THANKS || die "dodoc failed"

	newinitd "${FILESDIR}/${PN}-2.0.0_rc1.initd" "${PN}" || die "newinitd failed"
	newconfd "${FILESDIR}/${PN}-2.0.0_rc1.confd" "${PN}" || die "newconfd failed"

	keepdir /var/log/${PN} || die "keepdir failed"
}

pkg_postinst() {
	elog "The glusterfs startup script can be multiplexed."
	elog "The default startup script uses /etc/conf.d/glusterfs to configure the"
	elog "separate service.  To create additional instances of the glusterfs service"
	elog "simply create a symlink to the glusterfs startup script that is prefixed"
	elog "with \"glusterfs.\""
	elog
	elog "Example:"
	elog "    # cd /etc/init.d"
	elog "    # ln -s glusterfs glusterfs.client"
	elog "You can now treat glusterfs.client like any other service"
	echo
	elog "You can mount exported GlusterFS filesystems through /etc/fstab instead of"
	elog "through a startup script instance.  For more information visit:"
	elog "http://www.gluster.org/docs/index.php/Mounting_a_GlusterFS_Volume"
	echo
	ewarn "You need to use a ntp client to keep the clocks synchronized across all"
	ewarn "of your servers.  Setup a NTP synchronizing service before attempting to"
	ewarn "run GlusterFS."
}
