DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X"

DEPEND="virtual/miller-base
	sys-devel/gdb
	dev-util/valgrind
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
		net-misc/rdesktop
		media-gfx/gimp
		net-analyzer/wireshark
		x11-apps/xhost
		dev-db/tora
		dev-util/nemiver
		net-misc/tsclient
		kde-base/okteta
		dev-vcs/kdesvn
		net-analyzer/nmap
		dev-util/mono-debugger
		=dev-util/monodevelop-2.1*
		=dev-util/monodevelop-database-2.1*
		=dev-util/monodevelop-debugger-gdb-2.1*
		>=dev-db/pgadmin3-1.12
		kde-base/kcachegrind
		app-editors/gvim
	)"
