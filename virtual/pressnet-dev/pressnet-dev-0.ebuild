EAPI="4"
DESCRIPTION="Virtual for Pressnet development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X odbc ischroot strictversions"

RDEPEND="
	virtual/miller-base
	strictversions? (
		=sys-devel/gcc-4.1.2*
		=sys-devel/gcc-4.4.7*
		=dev-libs/boost-1.49*
	)
	dev-vcs/git
	app-vim/youcompleteme
	app-vim/syntastic
	sys-devel/gcc
	dev-libs/boost
	www-client/lynx
	sys-devel/gdb
	dev-util/valgrind
	app-text/htmltidy
	app-doc/doxygen
	media-fonts/freefont
	media-fonts/hack
	app-vim/vcscommand
	dev-util/splint
	=dev-cpp/libxmlpp-2.40*
	dev-libs/libxml2
	dev-java/maven-bin
	media-libs/imlib2
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	odbc? ( dev-db/myodbc )
	dev-util/cppunit
	app-vim/tt2-syntax
	dev-java/commons-fileupload
	dev-java/jakarta-jstl
	dev-java/sun-jdk:1.6
	dev-libs/omniEvents
	net-misc/omniORB
	virtual/mysql
	!ischroot? (
		www-servers/tomcat:5.5
		www-servers/apache
	)
	X? (
		|| ( www-client/google-chrome ( www-client/chromium www-plugins/chrome-binary-plugins ) )
		|| ( www-client/firefox www-client/firefox-bin )
		www-client/opera
		media-gfx/gimp
		dev-db/squirrel-sql[mysql]
		dev-util/kdbg
		kde-apps/okteta
		kde-apps/kcachegrind
		app-editors/gvim
   )"

