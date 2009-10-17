DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cdr nohardenedkernel nohourlyupdate fuse xfs bash-completion nomedia git
minimal autoupdate"

DEPEND="
	!minimal? ( www-servers/apache )
	sys-cluster/glusterfs
	sys-apps/inotail
	cdr? ( app-cdr/k3b )
	!nomedia? ( media-tv/mythtv )
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
	dev-util/cvs
	!minimal? ( x11-apps/xauth )
	sys-process/lsof
	app-portage/layman
	app-admin/syslog-ng
	app-admin/logrotate
	!minimal? ( app-admin/gkrellm )
	!minimal? ( app-antivirus/clamav )
	nohardenedkernel?  ( sys-kernel/gentoo-sources )
	!nohardenedkernel?  ( sys-kernel/hardened-sources )
	!minimal? ( app-text/unix2dos )
	app-misc/screen
	sys-boot/grub
	app-vim/gentoo-syntax
	sys-apps/kexec-tools
	!minimal? ( app-text/dos2unix )
	sys-auth/pam_ldap
	sys-auth/nss_ldap
	app-editors/gvim
	git? ( dev-util/git )
	!minimal? ( dev-util/strace )
	bash-completion? ( app-shells/bash-completion )
	"

src_install() {
	exeinto /etc/cron.weekly
	newexe "${FILESDIR}"/weekly-av-scan.cron av-scan || die

	exeinto /etc/cron.daily
	newexe "${FILESDIR}"/daily-av-update.cron av-update || die

	if [ -n "${UPDATETIME}" ]; then
		mkdir -p ${D}/etc/cron.d
		echo "${UPDATETIME} root /sbin/gentoo-portage-update" > ${D}/etc/cron.d/gentoo-portage-update
		exeinto /sbin
	else
		use nohourlyupdate && exeinto /etc/cron.daily
		use !nohourlyupdate && exeinto /etc/cron.hourly
	fi
	newexe "${FILESDIR}"/update.portage.cron-2 gentoo-portage-update || die

	exeinto /etc/portage/postsync.d/
	newexe "${FILESDIR}"/sync-distclean-exec.cron 88-portage-distclean-exec || die
	newexe "${FILESDIR}"/auto-download-packages 89-auto-download-package || die
	newexe "${FILESDIR}"/auto-update-overlays 10-auto-update-overlays || die
	newexe "${FILESDIR}"/write-new-updates 50-write-new-updates || die
	use autoupdate && dosym /sbin/update-install /etc/portage/postsync.d/99-update-install || die

	exeinto /sbin
	newexe "${FILESDIR}"/update-install2 update-install || die
	newexe "${FILESDIR}"/update-kernel update-kernel || die
}
