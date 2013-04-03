DESCRIPTION="Virtual for Miller kiosk"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

RDEPEND="
	virtual/miller-base
	x11-wm/evilwm
	x11-apps/xset
	x11-apps/xsetroot
	net-misc/dhcp
	sys-apps/ifplugd
	sys-power/acpid
	net-dialup/mingetty
	www-client/firefox
	"
