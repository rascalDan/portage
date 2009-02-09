DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="nohardenedkernel nohourlyupdate fuse xfs"

DEPEND="
sys-apps/hdparm
sys-libs/unscd
net-dns/bind-tools
fuse? ( sys-fs/sshfs-fuse )
net-fs/mount-cifs
xfs? ( sys-fs/xfsdump )
sys-fs/lvm2
>=app-portage/gentoolkit-0.2.1
sys-process/vixie-cron
sys-apps/eject
app-admin/sudo
mail-client/mailx
sys-apps/pciutils
app-dicts/myspell-en
net-misc/ntp
net-analyzer/netcat
net-ftp/ncftp
dev-util/cvs
x11-apps/xauth
sys-process/lsof
app-portage/layman
net-analyzer/net-snmp
app-admin/syslog-ng
app-admin/logrotate
app-admin/gkrellm
app-antivirus/clamav
nohardenedkernel?  ( sys-kernel/gentoo-sources )
!nohardenedkernel?  ( sys-kernel/hardened-sources )
app-text/unix2dos
app-misc/screen
sys-boot/grub
app-vim/gentoo-syntax
sys-apps/kexec-tools
app-text/dos2unix
sys-auth/pam_ldap
sys-auth/nss_ldap
"

src_install() {
	exeinto /etc/cron.weekly
	newexe "${FILESDIR}"/weekly-av-scan.cron av-scan || die
	newexe "${FILESDIR}"/weekly-distclean-exec-eclean.cron portage-distclean-exec || die

	exeinto /etc/cron.daily
	newexe "${FILESDIR}"/daily-av-update.cron av-update || die

	use nohourlyupdate && exeinto /etc/cron.daily
	use !nohourlyupdate && exeinto /etc/cron.hourly
	newexe "${FILESDIR}"/update.portage.cron gentoo-portage-update || die

	exeinto /etc/portage/postsync.d/
	newexe "${FILESDIR}"/auto-download-packages auto-download-package || die
}
