EAPI="6"
DESCRIPTION="Virtual for Miller workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="systemd plasma rdp vnc xscreensaver vlc"

RDEPEND="
	=net-misc/unison-2.48*
	=dev-lang/ocaml-4.04*
	systemd? ( app-admin/systemdgenie )
	virtual/miller-base
	kde-apps/kcalc
	vlc? ( media-video/vlc )
	net-im/pidgin
	x11-plugins/pidgin-mbpurple
	x11-plugins/purple-facebook
	x11-plugins/pidgin-skypeweb
	xscreensaver? ( x11-misc/xscreensaver )
	media-fonts/corefonts
	media-fonts/noto
	media-fonts/noto-emoji
	kde-misc/basket
	virtual/jre
	rdp? ( kde-apps/krdc[rdp] )
	vnc? ( kde-apps/krdc[vnc] )
	|| (
			www-client/firefox
			( www-client/chromium www-plugins/chrome-binary-plugins )
			www-client/firefox-bin
			www-client/google-chrome
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
	www-plugins/adobe-flash
	media-sound/clementine
	kde-apps/spectacle
	kde-apps/kwalletmanager
	x11-misc/kdocker
	kde-apps/okular
	kde-apps/gwenview
	kde-apps/dolphin
	kde-apps/konsole
	!plasma? ( kde-apps/kdebase-meta
		kde-base/kdm
		kde-base/kdebase-startkde
		kde-misc/gx-mail-notify )
	plasma? ( kde-plasma/plasma-meta
		x11-plugins/pidgin-indicator )
	media-gfx/geeqie
	kde-apps/ark
	x11-themes/oxygen-gtk
	"
