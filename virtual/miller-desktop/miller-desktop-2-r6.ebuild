DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="vpn wifi ndiswrapper b43 networkmanager input_devices_synaptics"

DEPEND="
	virtual/miller-base
	x11-base/xorg-server
	media-gfx/splash-themes-gentoo
	media-gfx/splash-themes-livecd
	media-sound/alsa-utils
	kde-base/kmix
	!networkmanager? (
		net-misc/dhcp )
	sys-power/acpid
	x11-apps/mesa-progs
	networkmanager? (
		|| ( gnome-extra/nm-applet kde-misc/knetworkmanager )
		vpn? ( net-misc/networkmanager-pptp )
		)
	wifi? ( net-wireless/wireless-tools
		net-wireless/wpa_supplicant
		net-dialup/ppp
		net-dialup/pptpclient
		net-dns/openresolv
		ndiswrapper? ( net-wireless/ndiswrapper )
		b43? ( net-wireless/b43-firmware )
		)
	sys-fs/dosfstools
	media-video/kmplayer
	input_devices_synaptics? ( kde-misc/synaptiks )
"

