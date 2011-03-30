DESCRIPTION="Virtual for Miller workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"

DEPEND="
	virtual/miller-base
	|| ( kde-base/kcalc kde-base/kdeutils )
	|| ( www-plugins/mplayerplug-in www-plugins/gecko-mediaplayer )
	net-im/pidgin
	x11-misc/xscreensaver
	media-fonts/corefonts
	virtual/jre
	|| ( kde-base/krdc kde-base/kdenetwork )
	kde-misc/kwebkitpart
	|| ( >=www-client/icecat-3.5 >=www-client/firefox-4 )
	media-video/mplayer2
	|| ( kde-misc/filelight kde-base/filelight )
	mail-client/thunderbird
	games-misc/fortune-mod
	|| ( app-office/libreoffice app-office/libreoffice-bin )
	media-gfx/gimp
	www-plugins/adobe-flash
	media-sound/clementine
	|| ( kde-base/ksnapshot kde-base/kdegraphics )
	|| ( kde-base/kdeartwork-kscreensaver kde-base/kdeartwork )
	|| ( kde-base/kdeutils-meta kde-base/kwalletmanager kde-base/kdeutils )
	|| ( kde-misc/kdocker kde-base/kdemisc )
	|| ( kde-base/superkaramba kde-base/kdeutils )
	|| ( kde-base/okular kde-base/kpdf kde-base/kdegraphics )
	kde-misc/gx-mail-notify
	kde-base/gwenview
	kde-base/kdebase-meta
	media-gfx/geeqie
	kde-base/ark
	kde-misc/kcm_gtk
	x11-themes/qtcurve-qt4
	x11-themes/gtk-engines-qtcurve
	"

