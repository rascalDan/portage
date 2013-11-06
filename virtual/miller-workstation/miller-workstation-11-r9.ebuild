EAPI="2"
DESCRIPTION="Virtual for Miller workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"

RDEPEND="
	virtual/miller-base
	kde-base/kcalc
	media-video/vlc
	net-im/skype
	net-im/pidgin
	x11-plugins/pidgin-mbpurple
	x11-misc/xscreensaver
	media-fonts/corefonts
	kde-misc/basket
	virtual/jre
	kde-base/krdc
	kde-misc/kwebkitpart
	|| (
			www-client/firefox
			www-client/chromium
			www-client/firefox-bin
			www-client/google-chrome
			www-client/opera
	   )
	kde-base/filelight
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
	kde-base/ksnapshot
	kde-base/kdeartwork-kscreensaver
	kde-base/kwallet
	x11-misc/kdocker
	kde-base/superkaramba
	kde-base/okular
	kde-misc/gx-mail-notify
	kde-base/gwenview
	kde-base/kdebase-meta
	media-gfx/geeqie
	kde-base/ark
	x11-themes/gtk-engines-qtcurve
	x11-themes/gtk-engines-xfce
	"

