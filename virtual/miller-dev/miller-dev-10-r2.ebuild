EAPI="4"
DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X dotnet odbc mysql postgres cxx"

RDEPEND="
	virtual/miller-base
	www-client/lynx
	www-client/chromium
	www-client/firefox
	www-client/opera
	postgres? ( dev-db/apgdiff )
	dev-util/uncrustify
	sys-devel/gdb
	dev-util/valgrind
	app-text/htmltidy
	app-doc/doxygen
	app-benchmarks/siege
	cxx? (
			dev-util/cppcheck
			sys-devel/clang[static-analyzer]
			app-vim/omnicppcomplete
			dev-util/splint
		 )
	media-fonts/freefont
	app-vim/vcscommand
	net-analyzer/arping
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
	odbc? (
			mysql? ( dev-db/myodbc )
			postgres? ( dev-db/psqlodbc )
		  )
	net-misc/youtube-dl
	www-servers/apache
	X? (
			|| (
				net-misc/tightvnc
				net-misc/vnc
			   )
			net-misc/rdesktop
			media-gfx/gimp
			kde-base/kruler
			net-analyzer/wireshark
			x11-apps/xhost
			dev-db/tora
			dev-db/squirrel-sql
			dev-util/nemiver
			dev-util/kdbg
			kde-base/okteta
			dev-vcs/kdesvn
			net-analyzer/nmap
			dotnet? (
				dev-util/mono-debugger
				dev-util/monodevelop
				|| (
					>=dev-util/monodevelop-4
					(
					 dev-util/monodevelop-database
					 dev-util/monodevelop-debugger-gdb
					)
				   )
				)
	postgres? ( >=dev-db/pgadmin3-1.12 )
	kde-base/kcachegrind
	app-editors/gvim
	)"

