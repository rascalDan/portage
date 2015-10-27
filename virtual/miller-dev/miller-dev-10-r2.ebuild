EAPI="4"
DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X dotnet odbc mysql postgres cxx"

RDEPEND="
	=net-misc/unison-2.48*
	=dev-lang/ocaml-4.02*
	virtual/miller-base
	app-vim/nerdtree
	app-vim/youcompleteme
	app-vim/syntastic
	www-client/lynx
	app-admin/webapp-config
	postgres? ( dev-db/apgdiff )
	dev-util/uncrustify
	net-nds/shelldap
	sys-devel/gdb
	dev-util/valgrind
	dev-util/lcov
	app-text/htmltidy
	app-doc/doxygen
	app-benchmarks/siege
	sys-fs/inotify-tools
	cxx? (
			dev-util/ccache
			dev-util/cppcheck
			sys-devel/clang[static-analyzer]
			dev-util/splint
		 )
	media-fonts/freefont
	media-fonts/hack
	app-vim/vcscommand
	dev-vcs/git
	dev-vcs/git-extras
	dev-util/patchutils
	net-analyzer/arping
	dev-libs/libadhocutil
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
		  )
	postgres? ( dev-db/psqlodbc )
	net-misc/youtube-dl
	www-servers/apache
	X? (
			|| ( www-client/google-chrome ( www-client/chromium www-plugins/chrome-binary-plugins ) )
			|| ( www-client/firefox www-client/firefox-bin )
			www-client/opera
			|| (
				net-misc/tightvnc
				net-misc/vnc
			   )
			net-misc/rdesktop
			media-gfx/gimp
			kde-apps/kruler
			net-analyzer/wireshark
			x11-apps/xhost
			dev-db/squirrel-sql
			dev-util/kdbg
			kde-apps/okteta
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
	kde-apps/kcachegrind
	app-editors/gvim
	)"

