DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

DEPEND="virtual/miller-apps
	app-text/htmltidy
	app-doc/doxygen
	net-misc/rdesktop
	media-gfx/gimp
	|| ( net-misc/tightvnc net-misc/vnc )
	app-vim/svncommand
	net-analyzer/wireshark
	x11-apps/xhost
	dev-db/tora
	net-analyzer/arping
	dev-util/splint
	app-vim/omnicppcomplete
	dev-libs/fcgi
	dev-cpp/glibmm
	dev-cpp/libxmlpp
	dev-util/nemiver
	www-apache/mod_fcgid
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-misc/tsclient
	|| ( kde-base/khexedit kde-base/okteta )
	net-ftp/ftp
	net-analyzer/nmap
	media-video/ffmpeg
	dev-util/desktop-file-utils
	dev-util/mono-debugger
	=dev-util/monodevelop-2.1*
	=dev-util/monodevelop-database-2.1*
	=dev-util/monodevelop-debugger-gdb-2.1*
	>=dev-db/pgadmin3-1.12
	dev-db/postgresql_autodoc
	kde-base/kcachegrind
	dev-db/myodbc
	www-apache/mod_transform
	net-misc/youtube-dl
	www-servers/apache
	app-editors/gvim"

