EAPI="4"
DESCRIPTION="Virtual for Pressnet development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X odbc ischroot strictversions idea-ultimate"

RDEPEND="
	virtual/miller-base
	strictversions? (
		=dev-libs/boost-1.48*
	)
	=sys-devel/gcc-4.4.7*
	dev-vcs/git
	app-vim/youcompleteme
	app-vim/syntastic
	sys-devel/gcc
	dev-libs/boost
	www-client/lynx
	sys-devel/gdb
	dev-util/valgrind
	app-text/tidy-html5
	app-doc/doxygen
	media-fonts/freefont
	media-fonts/hack
	app-vim/vcscommand
	dev-libs/libxml2
	dev-java/maven-bin
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	net-ftp/ftp
	odbc? ( dev-db/myodbc )
	app-vim/tt2-syntax
	virtual/jdk:1.8
	dev-libs/omniEvents
	net-misc/omniORB
	virtual/mysql
	!ischroot? (
		www-servers/tomcat:7
		www-servers/apache
	)
	X? (
		|| ( www-client/google-chrome ( www-client/chromium www-plugins/chrome-binary-plugins ) )
		|| ( www-client/firefox www-client/firefox-bin )
		idea-ultimate? ( dev-util/idea-ultimate )
		!idea-ultimate? ( dev-util/idea-community )
		www-client/opera
		media-gfx/gimp
		dev-db/squirrel-sql[mysql]
		dev-util/kdbg
		kde-apps/okteta
		kde-apps/kcachegrind
		app-editors/gvim
   )"

