DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="nohardenedkernel nohourlyupdate"

DEPEND="
|| (kde-base/kdebase kde-base/ksysguard)
net-dns/bind-tools
sys-fs/sshfs-fuse
sys-fs/xfsdump
app-portage/gentoolkit
sys-process/vixie-cron
sys-apps/eject
app-admin/sudo
mail-client/mailx
sys-apps/pciutils
net-misc/ntp
net-analyzer/netcat
net-ftp/ncftp
dev-util/cvs
x11-apps/xauth
sys-process/lsof
net-analyzer/net-snmp
app-admin/syslog-ng
app-admin/logrotate
app-admin/gkrellm
app-antivirus/clamav
nohardenedkernel?  ( sys-kernel/gentoo-sources)
!nohardenedkernel?  ( sys-kernel/hardened-sources)
app-text/unix2dos
app-misc/screen
sys-boot/grub
app-vim/gentoo-syntax
sys-apps/kexec-tools
app-text/dos2unix"

src_install() {
	exeinto /etc/cron.weekly
	newexe "${FILESDIR}"/daily-av-scan.cron av-scan || die
	exeinto /etc/cron.daily
	newexe "${FILESDIR}"/update.local.portage.cron portage-update || die
	use nohourlyupdate && exeinto /etc/cron.daily
	use !nohourlyupdate && exeinto /etc/cron.hourly
	newexe "${FILESDIR}"/update.portage.cron gentoo-portage-update || die
}
