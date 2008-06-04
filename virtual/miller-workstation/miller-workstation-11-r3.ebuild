DESCRIPTION="Virtual for Miller workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="firefox3"

DEPEND="
virtual/miller-base
|| ( kde-base/kdeutils kde-base/kcalc )
!firefox3? ( net-www/mplayerplug-in )
mail-client/mutt
net-im/pidgin
games-misc/fortune-mod-all
x11-themes/gtk-engines-qt
sys-devel/bc
sys-auth/nss_ldap
x11-misc/xscreensaver
media-fonts/corefonts
sys-auth/pam_ldap
dev-java/blackdown-jre
media-gfx/inkscape
|| ( kde-base/krdc kde-base/kdenetwork )
www-client/mozilla-firefox
media-video/mplayer
kde-misc/filelight
mail-client/mozilla-thunderbird
app-emulation/wine
net-mail/fetchmail
www-client/links
app-misc/freemind
games-misc/fortune-mod
app-office/openoffice-bin
media-gfx/gimp
net-www/netscape-flash
x11-plugins/pidgin-encryption
x11-themes/gtk-chtheme
media-gfx/gimageview
app-office/dia
net-misc/dhcp
x11-misc/googleearth
media-sound/amarok
|| ( kde-base/ksnapshot kde-base/kdegraphics )
|| ( kde-base/kdeartwork-kscreensaver kde-base/kdeartwork )
|| ( kde-base/kwalletmanager kde-base/kdeutils )
|| ( kde-misc/kdocker kde-base/kdemisc )
|| ( kde-base/superkaramba kde-base/kdeutils )
|| ( kde-base/kpdf kde-base/kdegraphics )
mail-client/mail-notification
"

