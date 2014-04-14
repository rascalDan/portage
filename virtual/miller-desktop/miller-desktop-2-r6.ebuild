DESCRIPTION="Virtual for desktops/laptops"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="vpnc pptp wifi ndiswrapper b43 networkmanager input_devices_synaptics fbsplash kde gnome"

RDEPEND="
	virtual/eject
	media-gfx/MIB-Ossigeno-Ultimate-Plymouth
	sys-boot/plymouth-openrc-plugin
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
		kde? ( kde-misc/plasma-nm )
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
		b43? ( sys-firmware/b43-firmware )
		)
	sys-fs/dosfstools
	sys-boot/syslinux
	input_devices_synaptics? ( kde? ( kde-misc/synaptiks ) )
"

