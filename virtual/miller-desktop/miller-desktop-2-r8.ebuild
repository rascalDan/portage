DESCRIPTION="Virtual for desktops/laptops"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="vpnc pptp wifi b43 networkmanager fbsplash kde gnome systemd plasma plymouth"

RDEPEND="
	virtual/eject
	plymouth? (
			media-gfx/MIB-Ossigeno-Ultimate-Plymouth
	)
	!systemd? (
		sys-boot/plymouth-openrc-plugin )
	virtual/miller-base
	x11-base/xorg-server
	kde-misc/yakuake
	fbsplash? (
			media-gfx/splash-themes-gentoo
			media-gfx/splash-themes-livecd
			)
	media-sound/alsa-utils
	kde? ( kde-apps/kmix )
	plasma? ( kde-apps/kmix )
	!networkmanager? (
		net-misc/dhcp )
	sys-power/acpid
	x11-apps/mesa-progs
	networkmanager? (
		gnome? ( gnome-extra/nm-applet )
		kde? ( !plasma? ( kde-misc/plasma-nm ) )
		plasma? ( kde-plasma/plasma-nm )
		pptp? ( net-misc/networkmanager-pptp )
		vpnc? ( net-misc/networkmanager-vpnc )
			)
	wifi? (
		net-wireless/wireless-tools
		net-wireless/wpa_supplicant
		net-dns/openresolv
		b43? ( sys-firmware/b43-firmware )
		)
	sys-fs/dosfstools
	sys-block/kvpm
	sys-boot/syslinux
"

