DESCRIPTION="Virtual for Miller workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"

DEPEND="
	virtual/miller-base
	|| ( kde-base/kcalc kde-base/kdeutils )
	|| ( www-plugins/mplayerplug-in www-plugins/gecko-mediaplayer )
	mail-client/mutt
	net-im/pidgin
	games-misc/fortune-mod-all
	sys-devel/bc
	x11-misc/xscreensaver
	media-fonts/corefonts
	virtual/jre
	|| ( kde-base/krdc kde-base/kdenetwork )
	>=www-client/mozilla-firefox-3
	media-video/mplayer
	kde-misc/filelight
	mail-client/mozilla-thunderbird
	app-emulation/wine
	games-misc/fortune-mod
	|| ( app-office/koffice-meta app-office/openoffice-bin )
	media-gfx/gimp
	www-plugins/adobe-flash
	x11-plugins/pidgin-encryption
	x11-plugins/pidgin-facebookchat
	net-misc/dhcp
	media-sound/amarok
	|| ( kde-base/ksnapshot kde-base/kdegraphics )
	|| ( kde-base/kdeartwork-kscreensaver kde-base/kdeartwork )
	|| ( kde-base/kdeutils-meta kde-base/kwalletmanager kde-base/kdeutils )
	|| ( kde-misc/kdocker kde-base/kdemisc )
	|| ( kde-base/superkaramba kde-base/kdeutils )
	|| ( kde-base/okular kde-base/kpdf kde-base/kdegraphics )
	mail-client/mail-notification
	sys-auth/pam_mount
	x11-themes/gtk-engines-ubuntulooks
	kde-base/gwenview
	kde-base/kdebase-meta
	kde-base/kdeplasma-addons
	"

