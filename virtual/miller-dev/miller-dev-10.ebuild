DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X"

DEPEND="virtual/miller-apps
	app-text/htmltidy
	app-doc/doxygen
	app-vim/svncommand
	net-analyzer/arping
	dev-util/splint
	app-vim/omnicppcomplete
	dev-libs/fcgi
	dev-cpp/glibmm
	dev-cpp/libxmlpp
	dev-libs/cgicc
	www-apache/mod_fcgid
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	media-video/ffmpeg
	dev-db/postgresql_autodoc
	dev-db/myodbc
	dev-db/psqlodbc
	www-apache/mod_transform
	net-misc/youtube-dl
	www-servers/apache
	X? (
		|| ( net-misc/tightvnc net-misc/vnc )
		X? net-misc/rdesktop
		X? media-gfx/gimp
		X? net-analyzer/wireshark
		X? x11-apps/xhost
		X? dev-db/tora
		X? dev-util/nemiver
		X? net-misc/tsclient
		X? kde-base/okteta
		X? dev-vcs/kdesvn
		X? net-analyzer/nmap
		X? dev-util/mono-debugger
		X? =dev-util/monodevelop-2.1*
		X? =dev-util/monodevelop-database-2.1*
		X? =dev-util/monodevelop-debugger-gdb-2.1*
		X? >=dev-db/pgadmin3-1.12
		X? kde-base/kcachegrind
		X? app-editors/gvim
	)"

