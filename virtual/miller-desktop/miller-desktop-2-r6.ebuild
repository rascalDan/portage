DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="vpnc pptp wifi ndiswrapper b43 networkmanager input_devices_synaptics fbsplash iwl3945
kde gnome"

DEPEND="
	virtual/miller-base
	x11-base/xorg-server
	fbsplash? (
			media-gfx/splash-themes-gentoo
			media-gfx/splash-themes-livecd
			)
	media-sound/alsa-utils
	kde? ( kde-base/kmix )
	!networkmanager? (
		net-misc/dhcp )
	sys-power/acpid
	x11-apps/mesa-progs
	networkmanager? (
		gnome? ( gnome-extra/nm-applet )
		kde? ( kde-misc/networkmanagement )
		pptp? ( net-misc/networkmanager-pptp )
		vpnc? ( net-misc/networkmanager-vpnc )
			)
	wifi? (
	net-wireless/wireless-tools
		net-wireless/wpa_supplicant
		net-dialup/ppp
		net-dialup/pptpclient
		net-dns/openresolv
		ndiswrapper? ( net-wireless/ndiswrapper )
		b43? ( net-wireless/b43-firmware )
		iwl3945? ( net-wireless/iwl3945-ucode )
		)
	sys-fs/dosfstools
	input_devices_synaptics? ( kde? ( kde-misc/synaptiks ) )
"

