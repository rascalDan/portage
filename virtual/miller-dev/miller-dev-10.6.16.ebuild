EAPI="7"
DESCRIPTION="Virtual for Miller development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X dotnet odbc mysql postgres cxx vnc java ilt +blender"

RDEPEND="
	=net-misc/unison-2.53*
	virtual/miller-base
	app-editors/ghostwriter
	app-shells/powerline
	app-shells/powerline-gitstatus
	app-vim/ansiesc
	app-vim/nerdtree
	app-vim/json
	app-vim/vim-javascript
	app-vim/vim-spell-en
	app-vim/nerdcommenter
	app-vim/youcompleteme
	app-vim/surround
	app-vim/syntastic
	app-vim/gitgutter
	app-vim/alternate
	app-vim/xsl-syntax
	www-client/lynx
	app-admin/webapp-config
	postgres? (
		virtual/miller-postgresql
		dev-db/apgdiff
		dev-db/pg_activity
		dev-db/postgresql_autodoc
		dev-libs/libdbpp-postgresql
		mysql? ( dev-db/postgresql-fdw-mysql )
		odbc? (
			dev-db/psqlodbc
			dev-libs/libdbpp-odbc
		)
	)
	mysql? (
		virtual/miller-mysql
		dev-libs/libdbpp-mysql
		odbc? ( dev-db/mariadb-connector-odbc )
	)
	java? (
		dev-java/maven-bin
		dev-util/intellij-idea
	)
	ilt? (
		blender? (
			media-gfx/blender
		)
		dev-libs/mxml:0
		media-gfx/openmesh
		media-libs/assimp
		x11-apps/rgb
	)
	dev-util/uncrustify
	dev-util/cproto
	dev-util/ctags
	dev-db/pgFormatter
	net-nds/shelldap
	dev-debug/gdb
	dev-debug/valgrind
	dev-util/lcov
	app-text/htmltidy
	app-text/doxygen
	app-benchmarks/wrk
	dev-libs/stb
	media-libs/libsdl2
	media-libs/glew
	sys-fs/inotify-tools
	net-misc/pssh
	app-misc/jq
	cxx? (
		dev-util/ccache
		dev-util/cppcheck
		llvm-core/clang[static-analyzer]
		dev-util/splint
		sys-devel/gcc:14
		sys-devel/gcc:15
		sys-devel/mold
		dev-util/bloaty
		dev-util/include-what-you-use
		dev-cpp/benchmark
	)
	media-fonts/freefont
	media-fonts/intel-one-mono
	app-vim/vcscommand
	dev-vcs/git
	dev-vcs/git-extras
	dev-vcs/git-revise
	sys-devel/distcc
	dev-util/patchutils
	|| (
		net-misc/iputils[arping]
		net-analyzer/arping
	)
	dev-libs/libadhocutil
	dev-libs/icetray[ut]
	www-misc/icespider
	net-misc/gentoobrowse-api
	dev-libs/fcgi
	dev-libs/Ice
	dev-libs/slice-parser
	dev-cpp/glibmm
	dev-cpp/libxmlpp:5.0
	dev-util/libabigail
	dev-util/unifdef
	net-libs/libesmtp
	www-apache/mod_fcgid
	www-apache/apache-mod-markdown
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	media-video/ffmpeg
	net-misc/yt-dlp
	www-servers/apache
	X? (
		|| ( www-client/google-chrome ( www-client/chromium www-plugins/chrome-binary-plugins ) )
		|| ( www-client/firefox www-client/firefox-bin )
		vnc? ( || (
			net-misc/tigervnc
			net-misc/vnc
			) )
		x11-misc/xdotool
		net-misc/rdesktop
		media-gfx/gimp
		kde-apps/kruler
		net-analyzer/wireshark
		dev-debug/apitrace
		x11-apps/xhost
		dev-db/squirrel-sql
		app-editors/okteta
		dev-debug/kdbg
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
		kde-apps/kcachegrind
		app-editors/gvim
		dev-debug/hotspot
	)"

