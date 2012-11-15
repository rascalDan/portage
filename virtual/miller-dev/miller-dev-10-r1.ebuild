DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X dotnet odbc mysql postgres"

DEPEND="virtual/miller-base
	www-client/lynx
	www-client/chromium
	|| ( www-client/firefox www-client/icecat )
	www-client/opera
	postgres? ( dev-db/apgdiff )
	sys-devel/gdb
	dev-util/valgrind
	app-text/htmltidy
	app-doc/doxygen
	dev-util/cppcheck
	media-fonts/freefont-ttf
	app-vim/vcscommand
	net-analyzer/arping
	dev-util/splint
	app-vim/omnicppcomplete
	dev-libs/fcgi
	dev-libs/Ice
	dev-cpp/glibmm
	dev-cpp/libxmlpp
	dev-libs/cgicc
	net-libs/libesmtp
	www-apache/mod_fcgid
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	media-video/ffmpeg
	postgres? ( dev-db/postgresql_autodoc )
	dev-db/squirrel-sql
	odbc? (
			mysql? ( dev-db/myodbc )
			postgres? ( dev-db/psqlodbc )
		  )
	www-apache/mod_transform
	net-misc/youtube-dl
	www-servers/apache
	X? (
		|| ( net-misc/tightvnc net-misc/vnc )
		net-misc/rdesktop
		media-gfx/gimp
		kde-base/kruler
		net-analyzer/wireshark
		x11-apps/xhost
		dev-db/tora
		dev-util/nemiver
		kde-base/okteta
		dev-vcs/kdesvn
		net-analyzer/nmap
		dotnet? (
			dev-util/mono-debugger
			=dev-util/monodevelop-2.1*
			=dev-util/monodevelop-database-2.1*
			=dev-util/monodevelop-debugger-gdb-2.1*
		)
		postgres? ( >=dev-db/pgadmin3-1.12 )
		kde-base/kcachegrind
		app-editors/gvim
	)"

