DESCRIPTION="Virtual for desktops/laptops"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cdr vpnc pptp forticlient wifi b43 networkmanager plymouth"

RDEPEND="
	virtual/eject
	plymouth? (
			media-gfx/MIB-Ossigeno-Ultimate-Plymouth
	)
	cdr? ( kde-apps/k3b )
	virtual/miller-base
	x11-base/xorg-server
	kde-apps/yakuake
	media-sound/alsa-utils
	kde-apps/kmix
	!networkmanager? (
		net-misc/dhcp )
	sys-power/acpid
	x11-apps/mesa-progs
	networkmanager? (
		kde-plasma/plasma-nm
		pptp? ( net-misc/networkmanager-pptp )
		vpnc? ( net-misc/networkmanager-vpnc )
		)
	wifi? (
		net-wireless/wireless-tools
		net-wireless/wpa_supplicant
		net-dns/openresolv
		b43? ( sys-firmware/b43-firmware )
		)
	forticlient? (
		net-vpn/forticlientsslvpn
		)
	sys-fs/dosfstools
	sys-block/partitionmanager
"

