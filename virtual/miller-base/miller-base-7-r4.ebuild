DESCRIPTION="Virtual for Miller servers"

EAPI="2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cdr hardened nohourlyupdate fuse xfs bash-completion nomedia git
minimal autoupdate autoshutdown autoservicerestart"

DEPEND="
	!minimal? ( www-servers/apache )
	sys-cluster/glusterfs
	sys-apps/inotail
	sys-apps/ethtool
	cdr? ( app-cdr/k3b )
	!nomedia? ( media-tv/mythtv media-plugins/mythvideo )
	sys-apps/hdparm
	sys-apps/unscd
	!minimal? ( net-dns/bind-tools )
	fuse? ( sys-fs/sshfs-fuse )
	!minimal? ( || ( net-fs/mount-cifs net-fs/samba-client ) )
	xfs? ( sys-fs/xfsdump )
	sys-fs/lvm2
	>=app-portage/gentoolkit-0.2.1
	sys-process/vixie-cron
	!minimal? ( sys-apps/eject )
	app-admin/sudo
	mail-client/mailx
	sys-apps/pciutils
	!minimal? ( app-dicts/myspell-en )
	net-misc/ntp
	!minimal? ( net-analyzer/netcat )
	!minimal? ( net-ftp/ncftp )
	dev-vcs/cvs
	!minimal? ( x11-apps/xauth )
	sys-process/lsof
	app-portage/layman[cvs]
	app-admin/syslog-ng
	app-admin/logrotate
	!minimal? ( app-antivirus/clamav )
	!hardened? ( sys-kernel/tuxonice-sources )
	hardened? ( sys-kernel/hardened-sources )
	!minimal? ( ||
		( app-text/dos2unix <app-text/unix2dos-5 )
		( >=app-text/dos2unix-5 !app-text/unix2dos ) )
	app-misc/screen
	sys-boot/grub
	app-vim/gentoo-syntax
	sys-apps/kexec-tools
	sys-auth/pam_ldap
	sys-auth/nss_ldap
	app-editors/gvim
	git? ( dev-vcs/git )
	!minimal? ( dev-util/strace )
	bash-completion? ( app-shells/bash-completion )
	net-misc/wakeonlan
	"

src_install() {
	exeinto /etc/cron.weekly
	use !minimal && newexe "${FILESDIR}"/weekly-av-scan.cron av-scan

	exeinto /etc/cron.daily
	use !minimal && newexe "${FILESDIR}"/daily-av-update.cron av-update

	if [ -n "${UPDATETIME}" ]; then
		mkdir -p ${D}/etc/cron.d
		echo "${UPDATETIME} root /sbin/gentoo-portage-update" > ${D}/etc/cron.d/gentoo-portage-update
		exeinto /sbin
	else
		use nohourlyupdate && exeinto /etc/cron.daily
		use !nohourlyupdate && exeinto /etc/cron.hourly
	fi
	newexe "${FILESDIR}"/update.portage.cron-2 gentoo-portage-update

	exeinto /etc/portage/postsync.d/
	newexe "${FILESDIR}"/sync-distclean-exec.cron 88-portage-distclean-exec
	use !autoupdate && newexe "${FILESDIR}"/auto-download-packages 89-auto-download-package
	newexe "${FILESDIR}"/auto-update-overlays 10-auto-update-overlays
	newexe "${FILESDIR}"/write-new-updates 50-write-new-updates
	if use autoupdate ; then
		dosym /sbin/update-install /etc/portage/postsync.d/98-update-install
		if use autoshutdown ; then
			newexe "${FILESDIR}"/update-autoshutdown 99-auto-shutdown
		else
			if use autoservicerestart ; then
				exeinto /usr/libexec/scripts/auto-restart
				for f in ${FILESDIR}/restart/* ; do
					newexe ${FILESDIR}/restart/`basename $f` `basename $f`
				done
				exeinto /etc/portage/postsync.d/
				newexe "${FILESDIR}"/auto-restart-services 99-auto-restart-services
			fi
		fi
	fi

	exeinto /sbin
	newexe "${FILESDIR}"/update-install2 update-install
	newexe "${FILESDIR}"/update-kernel update-kernel
}
