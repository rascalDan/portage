EAPI="2"
DESCRIPTION="Virtual for Miller workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="systemd"

RDEPEND="
	systemd? ( kde-misc/systemd-kcm )
	virtual/miller-base
	kde-apps/kcalc
	media-video/vlc
	net-im/skype
	net-im/pidgin
	x11-plugins/pidgin-mbpurple
	x11-misc/xscreensaver
	media-fonts/corefonts
	kde-misc/basket
	virtual/jre
	kde-apps/krdc
	kde-misc/kwebkitpart
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
	kde-apps/ksnapshot
	kde-apps/kdeartwork-kscreensaver
	|| ( kde-frameworks/kwallet kde-apps/kwalletmanager )
	x11-misc/kdocker
	kde-apps/superkaramba
	kde-apps/okular
	kde-misc/gx-mail-notify
	kde-apps/gwenview
	kde-apps/kdebase-meta
	media-gfx/geeqie
	kde-apps/ark
	x11-themes/qtcurve
	x11-themes/gtk-engines-xfce
	"

