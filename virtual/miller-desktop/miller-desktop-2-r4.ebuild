DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="laptop ndiswrapper b43"

DEPEND="
	virtual/miller-base
	media-gfx/splash-themes-gentoo
	media-gfx/splash-themes-livecd
	media-sound/alsa-utils
	media-sound/alsamixergui
	|| ( sys-apps/ifplugd
		net-wireless/wpa_supplicant
		sys-apps/netplug )
	sys-power/acpid
	sys-apps/v86d
	x11-apps/mesa-progs
	laptop? ( net-wireless/wireless-tools
		net-wireless/wpa_supplicant
		net-dialup/ppp
		net-dialup/pptpclient
		net-dns/openresolv )
	ndiswrapper? ( net-wireless/ndiswrapper )
	b43? ( net-wireless/b43-fwcutter )
"

