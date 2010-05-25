DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="laptop ndiswrapper b43 networkmanager"

DEPEND="
	virtual/miller-base
	x11-base/xorg-server
	media-gfx/splash-themes-gentoo
	media-gfx/splash-themes-livecd
	media-sound/alsa-utils
	kde-base/kmix
	!networkmanager? ( || ( sys-apps/netplug
		sys-apps/ifplugd ) )
	sys-power/acpid
	x11-apps/mesa-progs
	net-misc/dhcp
	networkmanager? (
		kde-misc/knetworkmanager
		laptop? ( net-misc/networkmanager-pptp )
		)
	laptop? ( net-wireless/wireless-tools
		net-wireless/wpa_supplicant
		net-dialup/ppp
		net-dialup/pptpclient
		net-dns/openresolv )
	ndiswrapper? ( net-wireless/ndiswrapper )
	b43? ( net-wireless/b43-firmware )
	sys-fs/dosfstools
	media-video/kmplayer
"

