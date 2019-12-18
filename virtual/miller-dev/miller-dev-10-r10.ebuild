EAPI="6"
DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X dotnet odbc mysql postgres cxx"

RDEPEND="
	=net-misc/unison-2.48*
	=dev-lang/ocaml-4.04*
	virtual/miller-base
	app-text/cutemarked
	app-vim/nerdtree
	app-vim/json
	app-vim/vim-javascript
	app-vim/vim-spell-en
	app-vim/nerdcommenter
	app-vim/youcompleteme
	app-vim/syntastic
	app-vim/gitgutter
	app-vim/alternate
	app-vim/xsl-syntax
	www-client/lynx
	app-admin/webapp-config
	postgres? (
			dev-db/apgdiff
			dev-db/postgresql_autodoc )
	dev-util/uncrustify
	dev-util/cproto
	dev-util/ctags
	net-nds/shelldap
	sys-devel/gdb
	dev-util/valgrind
	dev-util/lcov
	app-text/tidy-html5
	app-doc/doxygen
	app-benchmarks/wrk
	sys-fs/inotify-tools
	net-misc/pssh
	app-misc/jq
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
	sys-devel/distcc
	dev-util/patchutils
	|| (
		net-misc/iputils[arping]
		net-analyzer/arping
	)
	dev-libs/libadhocutil
	dev-libs/libdbpp-postgresql
	dev-libs/libdbpp-mysql
	dev-libs/icetray[ut]
	dev-libs/fcgi
	dev-libs/Ice
	dev-cpp/glibmm
	dev-cpp/libxmlpp:3.0
	net-libs/libesmtp
	www-apache/mod_fcgid
	www-apache/apache-mod-markdown
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	media-video/ffmpeg
	odbc? (
			mysql? ( dev-db/myodbc )
			postgres? ( dev-db/psqlodbc )
		  )
	net-misc/youtube-dl
	www-servers/apache
	X? (
			|| ( www-client/google-chrome ( www-client/chromium www-plugins/chrome-binary-plugins ) )
			|| ( www-client/firefox www-client/firefox-bin )
			|| (
				net-misc/tigervnc
				net-misc/vnc
			   )
			net-misc/rdesktop
			media-gfx/gimp
			kde-apps/kruler
			net-analyzer/wireshark
			x11-apps/xhost
			dev-db/squirrel-sql
			app-editors/okteta
			kde-apps/dolphin-plugins-git
			net-analyzer/nmap
			dotnet? (
				dev-util/monodevelop
				|| (
					>=dev-util/monodevelop-4
					(
					 dev-util/monodevelop-database
					 dev-util/monodevelop-debugger-gdb
					)
				   )
				)
	postgres? (
			|| (
				dev-db/pgadmin4
				dev-db/pgadmin3
			   ) )
	kde-apps/kcachegrind
	app-editors/gvim
	)"

