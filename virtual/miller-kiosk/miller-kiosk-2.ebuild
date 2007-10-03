DESCRIPTION="Virtual for Miller kiosk"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

DEPEND="
virtual/miller-base
x11-wm/fluxbox
|| (kde-base/kdm kde-base/kdebase)
net-misc/dhcp
sys-apps/ifplugd
www-client/mozilla-firefox
"
