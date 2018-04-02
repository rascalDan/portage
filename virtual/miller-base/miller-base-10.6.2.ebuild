EAPI="6"
inherit systemd
DESCRIPTION="Virtual for base systems"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cdr hardened nohourlyupdate fuse xfs btrfs bash-completion git samba
minimal autoupdate autoshutdown autoservicerestart sw-suspend mdadm
video_cards_nvidia video_cards_nouveau firmware ischroot"

RDEPEND="
	app-misc/simplify
	app-arch/hardlink
	sys-process/htop
	sys-process/iotop
	sys-apps/less
	fuse? ( net-fs/sshfs )
	!ischroot? (
		sys-kernel/kergen
		sys-apps/ethtool
		sys-cluster/netfs
		sys-apps/kexec-tools
		>=app-admin/eclean-kernel-1.99
		mdadm? ( sys-fs/mdadm )
		cdr? ( kde-apps/k3b )
		sys-apps/hdparm
		xfs? ( sys-fs/xfsdump )
		btrfs? ( sys-fs/btrfs-progs )
		sys-fs/lvm2
		>=sys-boot/grub-2
		sys-apps/busybox
		sys-kernel/genkernel-next
		sys-process/vixie-cron
		sys-apps/pciutils
		sys-apps/usbutils
		samba? ( || ( net-fs/cifs-utils net-fs/samba[client] ) )
		firmware? ( sys-kernel/linux-firmware )
		app-admin/logrotate
		video_cards_nvidia? ( sys-apps/v86d )
		video_cards_nouveau? ( sys-firmware/nvidia-firmware )
	)
	>=app-portage/gentoolkit-0.2.1
	app-admin/sudo
	mail-client/mailx
	!minimal? (
			app-shells/thefuck
			app-shells/hstr
			x11-apps/xauth
			sys-apps/moreutils
			dev-util/strace
			net-analyzer/netcat
			net-ftp/ncftp
			app-text/dos2unix
			net-dns/bind-tools
			!ischroot? (
				www-servers/apache
				app-antivirus/clamav
				)
			)
	sys-process/lsof
	app-portage/layman[git]
	!hardened? (
		sys-devel/prelink
	)
	!ischroot? (
		!sw-suspend? ( sys-kernel/gentoo-sources )
		sw-suspend? ( sys-apps/tuxonice-userui
			|| ( sys-kernel/tuxonice-sources
				sys-kernel/pf-sources ) ) )
	app-misc/screen
	app-vim/gentoo-syntax
	sys-auth/pam_ldap
	sys-auth/nss_ldap
	app-editors/gvim
	git? ( dev-vcs/git )
	bash-completion? ( app-shells/bash-completion )
	sys-apps/systemd
	autoservicerestart? (
			sys-apps/autorestart
		)
	"

src_unpack() {
	mkdir ${S}
}

src_install() {
	exeinto /etc/cron.hourly
	newexe "${FILESDIR}"/service-check.systemd service-check
	systemd_newtmpfilesd "${FILESDIR}/tmpfiles-d-portage.conf" "portage.conf"
	dodir /etc/systemd/system/multi-user.target.wants
	dosym /lib/systemd/system/freshclamd.service /etc/systemd/system/multi-user.target.wants/freshclamd.service
	dosym /lib/systemd/system/nscd.service /etc/systemd/system/multi-user.target.wants/nscd.service
	dosym /lib/systemd/system/sshd.service /etc/systemd/system/multi-user.target.wants/sshd.service
	dosym /lib/systemd/system/vixie-cron.service /etc/systemd/system/multi-user.target.wants/vixie-cron.service

	exeinto /etc/cron.weekly
	use !minimal && newexe "${FILESDIR}"/weekly-av-scan.cron av-scan
	use !minimal && newexe "${FILESDIR}"/kernels-cleaner kernels-cleaner

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
	newexe "${FILESDIR}"/write-new-updates 50-write-new-updates
	newexe "${FILESDIR}"/newkernel 80-newkernel
	newexe "${FILESDIR}"/systemd-reload 90-systemd-reload
	if use autoupdate ; then
		dosym /sbin/update-install /etc/portage/postsync.d/75-update-install
		if use autoshutdown ; then
			newexe "${FILESDIR}"/update-autoshutdown 99-auto-shutdown
		fi
	fi

	exeinto /sbin
	newexe "${FILESDIR}"/update-install2 update-install
}