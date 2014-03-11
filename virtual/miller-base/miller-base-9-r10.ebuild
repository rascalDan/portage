EAPI="2"
DESCRIPTION="Virtual for base systems"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cdr hardened nohourlyupdate fuse xfs bash-completion git fbsplash samba
minimal autoupdate autoshutdown autoservicerestart lvmboot lvmroot sw-suspend raid
video_cards_nvidia firmware"

RDEPEND="
	sys-apps/kexec-tools
	sys-process/htop
	sys-apps/less
	app-admin/eclean-kernel
	raid? ( sys-fs/mdadm )
	app-admin/ide-smart
	sys-cluster/glusterfs
	sys-cluster/netfs
	sys-apps/ethtool
	net-misc/unison
	cdr? ( app-cdr/k3b )
	sys-apps/hdparm
	fuse? ( sys-fs/sshfs-fuse )
	xfs? ( sys-fs/xfsdump )
	sys-fs/lvm2
	lvmboot? ( >=sys-boot/grub-1.98 )
	lvmroot? (
			sys-apps/busybox
			|| ( sys-kernel/dracut[dracut_modules_lvm] >=sys-kernel/dracut-036 )
			)
	video_cards_nvidia? ( sys-apps/v86d )
	>=app-portage/gentoolkit-0.2.1
	sys-process/vixie-cron
	app-admin/sudo
	mail-client/mailx
	sys-apps/pciutils
	sys-apps/usbutils
	net-misc/ntp
	!minimal? (
			x11-apps/xauth
			sys-apps/moreutils
			dev-util/strace
			net-analyzer/netcat
			net-ftp/ncftp
			app-text/dos2unix
			net-dns/bind-tools 
			www-servers/apache 
			app-antivirus/clamav 
			)
	samba? ( || ( net-fs/cifs-utils net-fs/samba[client] ) )
	firmware? ( sys-kernel/linux-firmware )
	sys-process/lsof
	app-portage/layman[subversion]
	app-admin/syslog-ng
	app-admin/logrotate
	!hardened? ( 
			sys-devel/prelink
			!sw-suspend? ( sys-kernel/gentoo-sources )
			sw-suspend? ( sys-apps/tuxonice-userui
				|| ( sys-kernel/tuxonice-sources
					sys-kernel/pf-sources ) ) )
	hardened? ( sys-kernel/hardened-sources sys-apps/gradm )
	app-misc/screen
	sys-boot/grub
	app-vim/gentoo-syntax
	sys-auth/pam_ldap
	sys-auth/nss_ldap
	app-editors/gvim
	git? ( dev-vcs/git )
	bash-completion? ( app-shells/bash-completion )
	net-misc/wakeonlan
	"

src_install() {
	exeinto /etc/cron.hourly
	newexe "${FILESDIR}"/service-check service-check

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