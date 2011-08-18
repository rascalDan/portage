DESCRIPTION="Virtual for Miller servers"

EAPI="2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cdr hardened nohourlyupdate fuse xfs bash-completion git fbsplash
minimal autoupdate autoshutdown autoservicerestart lvmboot lvmroot sw-suspend raid
video_cards_nvidia"

DEPEND="
	!minimal? ( www-servers/apache )
	raid? ( sys-fs/mdadm )
	app-admin/ide-smart
	sys-cluster/glusterfs
	sys-cluster/netfs
	sys-apps/ethtool
	cdr? ( app-cdr/k3b )
	sys-apps/hdparm
	sys-apps/unscd
	!minimal? ( net-dns/bind-tools )
	fuse? ( sys-fs/sshfs-fuse )
	!minimal? ( || (
		net-fs/mount-cifs
		net-fs/samba-client
		net-fs/samba[client] ) )
	xfs? ( sys-fs/xfsdump )
	!lvmroot? ( sys-fs/lvm2 )
	lvmboot? ( >=sys-boot/grub-1.98 )
	lvmroot? (
			sys-fs/lvm2[static]
			sys-apps/busybox[static]
			sys-kernel/dracut[dracut_modules_lvm]
			)
	video_cards_nvidia? ( sys-apps/v86d )
	>=app-portage/gentoolkit-0.2.1
	sys-process/vixie-cron
	!minimal? ( virtual/eject )
	app-admin/sudo
	mail-client/mailx
	sys-apps/pciutils
	!minimal? ( app-dicts/myspell-en )
	net-misc/ntp
	!minimal? ( net-analyzer/netcat )
	!minimal? ( net-ftp/ncftp )
	!minimal? ( x11-apps/xauth )
	sys-process/lsof
	app-portage/layman[subversion]
	app-admin/syslog-ng
	app-admin/logrotate
	!minimal? ( app-antivirus/clamav )
	!hardened? ( 
			!sw-suspend? ( sys-kernel/gentoo-sources )
			sw-suspend? ( sys-apps/tuxonice-userui
				|| ( sys-kernel/tuxonice-sources
					sys-kernel/pf-sources ) ) )
	hardened? ( sys-kernel/hardened-sources =sys-apps/gradm-2.2.2* )
	!minimal? ( ||
		( app-text/dos2unix <app-text/unix2dos-5 )
		( >=app-text/dos2unix-5 !app-text/unix2dos ) )
	app-misc/screen
	sys-boot/grub
	app-vim/gentoo-syntax
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
	newexe "${FILESDIR}"/sync-distclean-exec.cron 60-portage-distclean-exec
	use !autoupdate && newexe "${FILESDIR}"/auto-download-packages 70-auto-download-package
	newexe "${FILESDIR}"/auto-update-overlays 10-auto-update-overlays
	newexe "${FILESDIR}"/write-new-updates 50-write-new-updates
	if use autoupdate ; then
		dosym /sbin/update-install /etc/portage/postsync.d/75-update-install
		if use autoshutdown ; then
			newexe "${FILESDIR}"/update-autoshutdown 99-auto-shutdown
		else
			if use autoservicerestart ; then
				exeinto /usr/libexec/scripts/auto-restart
				for f in ${FILESDIR}/restart/* ; do
					newexe ${FILESDIR}/restart/`basename $f` `basename $f`
				done
				exeinto /etc/portage/postsync.d/
				newexe "${FILESDIR}"/auto-restart-services 80-auto-restart-services
			fi
		fi
	fi

	exeinto /sbin
	newexe "${FILESDIR}"/update-install2 update-install
	newexe "${FILESDIR}"/update-kernel update-kernel
}
