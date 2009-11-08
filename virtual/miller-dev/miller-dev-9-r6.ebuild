DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

DEPEND="virtual/miller-apps
	app-text/htmltidy
	app-doc/doxygen
	>=dev-db/slony1-1.2.15
	net-misc/rdesktop
	media-gfx/gimp
	dev-util/colorcvs
	|| ( net-misc/tightvnc net-misc/vnc )
	media-gfx/gqview
	app-vim/cvsmenu
	net-analyzer/wireshark
	x11-apps/xhost
	dev-db/tora
	kde-base/cervisia
	net-analyzer/arping
	dev-util/splint
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	sys-process/htop
	app-arch/rar
	net-misc/tsclient
	dev-util/indent
	sys-devel/bc
	dev-util/weblint
	|| ( kde-base/khexedit kde-base/okteta )
	net-ftp/ftp
	net-misc/telnet-bsd
	dev-util/qsoapman
	dev-util/colorgcc
	net-analyzer/nmap
	media-video/ffmpeg
	>=dev-util/monodevelop-0.13
	dev-util/desktop-file-utils
	dev-util/mono-debugger
	dev-util/monodevelop-database
	dev-util/monodevelop-debugger-gdb
	dev-util/monodevelop-debugger-mdb
	dev-db/pgadmin3
	dev-db/postgresql_autodoc
	kde-base/kcachegrind
	dev-db/myodbc
	www-apache/mod_transform
	www-apps/dbweb
	www-servers/apache
	app-editors/gvim"

