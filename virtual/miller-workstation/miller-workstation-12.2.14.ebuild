EAPI="7"
DESCRIPTION="Virtual for Miller workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="rdp vnc xscreensaver vlc screencast vaapi video_cards_nvidia"

RDEPEND="
	=net-misc/unison-2.53*
	app-admin/systemdgenie
	virtual/miller-base
	kde-apps/kcalc
	vlc? ( media-video/vlc )
	net-im/pidgin
	x11-plugins/pidgin-mbpurple
	xscreensaver? ( x11-misc/xscreensaver )
	media-fonts/corefonts
	media-fonts/noto
	media-fonts/noto-emoji
	kde-misc/basket
	virtual/jre
	rdp? ( kde-apps/krdc[rdp] )
	vnc? ( kde-apps/krdc[vnc] )
	|| (
		(
			www-client/firefox
			vaapi? ( video_cards_nvidia? (
				media-libs/nvidia-vaapi-driver
				) )
		)
		(
			|| (
				www-client/chromium:0/stable
				www-client/chromium-bin:0/stable
			)
			www-plugins/chrome-binary-plugins
		)
		www-client/firefox-bin
		www-client/google-chrome
		www-client/microsoft-edge
		www-client/opera
	)
	kde-apps/filelight
	|| (
		mail-client/thunderbird-bin
		mail-client/thunderbird
	)
	games-misc/fortune-mod
	|| (
		app-office/libreoffice-bin
		app-office/libreoffice
	)
	media-gfx/gimp
	media-sound/strawberry
	kde-plasma/spectacle
	kde-apps/kwalletmanager
	x11-misc/kdocker
	kde-apps/okular
	kde-apps/gwenview
	kde-apps/dolphin
	kde-apps/konsole
	kde-plasma/plasma-meta
	media-gfx/geeqie
	kde-apps/ark
	x11-themes/oxygen-gtk
	x11-apps/xrandr
	screencast? (
		kde-plasma/xdg-desktop-portal-kde
	)
	"

