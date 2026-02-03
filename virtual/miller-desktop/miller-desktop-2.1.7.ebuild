EAPI="8"
DESCRIPTION="Virtual for desktops/laptops"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cdr vpnc pptp forticlient openconnect wifi b43 networkmanager vaapi video_cards_intel wayland"

RDEPEND="
	cdr? ( kde-apps/k3b )
	virtual/miller-base
	x11-base/xorg-server
	wayland? (
		app-misc/wayland-utils
		dev-libs/weston
	)
	kde-apps/yakuake
	media-sound/alsa-utils
	!networkmanager? (
		net-misc/dhcp )
	sys-power/acpid
	x11-apps/mesa-progs
	vaapi? (
		video_cards_intel? (
			media-libs/libva-intel-driver
		)
	)
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
	openconnect? (
		net-vpn/openconnect
		net-libs/webkit-gtk:4.1
		)
	sys-fs/dosfstools
	sys-block/partitionmanager
"

