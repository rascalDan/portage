EAPI="7"
inherit systemd tmpfiles
DESCRIPTION="Virtual for base systems"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="hardened nohourlyupdate fuse xfs btrfs bash-completion git samba
minimal autoupdate autoshutdown autoservicerestart mdadm ssd X
video_cards_nvidia video_cards_nouveau firmware ischroot ldap"

RDEPEND="
	app-misc/simplify
	|| ( app-arch/hardlink sys-apps/util-linux[hardlink] )
	sys-process/htop
	sys-process/time
	sys-apps/less
	fuse? ( net-fs/sshfs )
	!ischroot? (
		net-fs/autofs
		sys-kernel/kergen
		sys-apps/ethtool
		sys-cluster/netfs
		sys-apps/kexec-tools
		>=app-admin/eclean-kernel-1.99
		mdadm? ( sys-fs/mdadm )
		!ssd? (
			sys-apps/systemd-readahead
			)
		xfs? ( sys-fs/xfsdump )
		btrfs? (
			sys-fs/btrfs-progs
			sys-fs/btrfsmaintenance
			)
		sys-fs/lvm2
		sys-boot/grub
		sys-apps/pciutils
		sys-apps/usbutils
		samba? ( || ( net-fs/cifs-utils net-fs/samba[client] ) )
		firmware? ( sys-kernel/linux-firmware sys-firmware/intel-microcode )
		app-admin/logrotate
		video_cards_nouveau? ( sys-firmware/nvidia-firmware )
		app-antivirus/clamav
		sys-kernel/gentoo-kernel
		sys-apps/deswappify-auto
	)
	sys-process/cronie
	app-portage/gentoolkit
	app-admin/sudo
	app-admin/hddtemp
	mail-client/mailx
	!minimal? (
		app-shells/hstr
		X? (
			x11-apps/xauth
		)
		sys-apps/moreutils
		dev-debug/strace
		|| (
			net-analyzer/netcat
			net-analyzer/nmap[ncat,symlink]
		)
		net-ftp/ncftp
		app-text/dos2unix
		net-dns/bind
	)
	sys-process/lsof
	app-eselect/eselect-repository
	app-misc/screen
	app-vim/gentoo-syntax
	ldap? (
		sys-auth/nss-pam-ldapd
	)
	app-editors/vim
	X? (
		app-editors/gvim
	)
	git? ( dev-vcs/git )
	bash-completion? ( app-shells/bash-completion )
	sys-apps/systemd
	autoservicerestart? (
		sys-apps/autorestart
	)
	app-portage/cpuid2cpuflags
	app-text/ansifilter
	"

src_unpack() {
	mkdir ${S}
}

src_install() {
	exeinto /etc/cron.hourly
	newexe "${FILESDIR}"/service-check.systemd service-check
	newtmpfiles "${FILESDIR}/tmpfiles-d-portage.conf" "portage.conf"
	dodir /etc/systemd/system/multi-user.target.wants
	use !ischroot && dosym /lib/systemd/system/freshclamd.service /etc/systemd/system/multi-user.target.wants/freshclamd.service
	dosym /lib/systemd/system/nscd.service /etc/systemd/system/multi-user.target.wants/nscd.service
	use !ischroot && dosym /lib/systemd/system/sshd.service /etc/systemd/system/multi-user.target.wants/sshd.service
	dosym /lib/systemd/system/cronie.service /etc/systemd/system/multi-user.target.wants/cronie.service

	exeinto /etc/cron.weekly
	use !ischroot && newexe "${FILESDIR}"/weekly-av-scan.cron av-scan
	use !ischroot && newexe "${FILESDIR}"/kernels-cleaner kernels-cleaner
	use !minimal && newexe "${FILESDIR}"/hardlink-ccache hardlink-ccache

	if [[ -n ${UPDATETIME} ]]; then
		if [[ ${UPDATETIME} = @* ]]; then
			exeinto /etc/cron.${UPDATETIME#"@"}
		else
			mkdir -p ${D}/etc/cron.d
			echo "${UPDATETIME} root /sbin/gentoo-portage-update" > ${D}/etc/cron.d/gentoo-portage-update
			exeinto /sbin
		fi
	else
		use nohourlyupdate && exeinto /etc/cron.daily
		use !nohourlyupdate && exeinto /etc/cron.hourly
	fi
	newexe "${FILESDIR}"/update.portage.cron-2 gentoo-portage-update

	exeinto /etc/portage/postsync.d/
	newexe "${FILESDIR}"/sync-distclean-exec.cron 60-portage-distclean-exec
	use !autoupdate && newexe "${FILESDIR}"/auto-download-packages 70-auto-download-package
	newexe "${FILESDIR}"/write-new-updates 50-write-new-updates
	newexe "${FILESDIR}"/systemd-reload 90-systemd-reload
	newexe "${FILESDIR}"/linkfiles 98-linkfiles
	if use autoupdate ; then
		dosym /sbin/update-install /etc/portage/postsync.d/75-update-install
		if use autoshutdown ; then
			newexe "${FILESDIR}"/update-autoshutdown 99-auto-shutdown
		fi
	fi

	exeinto /sbin
	newexe "${FILESDIR}"/update-install2 update-install
}

pkg_postinst() {
	tmpfiles_process "portage.conf"
}
