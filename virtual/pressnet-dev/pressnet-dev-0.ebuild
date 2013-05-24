EAPI="4"
DESCRIPTION="Virtual for Pressnet development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X odbc"

RDEPEND="
	virtual/miller-base
	www-client/lynx
	www-client/chromium
	www-client/firefox
	www-client/opera
	sys-devel/gdb
	dev-util/valgrind
	app-text/htmltidy
	app-doc/doxygen
	media-fonts/freefont
	app-vim/vcscommand
	dev-util/splint
	app-vim/omnicppcomplete
	dev-cpp/libxmlpp
	dev-libs/libxml2
	dev-java/maven-bin
	media-libs/imlib2
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	odbc? ( dev-db/myodbc )
	dev-util/cppunit
	www-servers/apache
	app-vim/tt2-syntax
	dev-java/commons-fileupload
	dev-java/jakarta-jstl
	dev-java/sun-jdk
	dev-java/sun-jre-bin
	dev-libs/omniEvents
	net-misc/omniORB
	www-servers/tomcat:5.5
	X? (
			|| ( dev-util/eclipse-sdk dev-util/eclipse-sdk-bin )
			media-gfx/gimp
			dev-db/squirrel-sql[mysql]
			dev-db/tora[mysql]
			dev-util/nemiver
			kde-base/okteta
			dev-vcs/kdesvn
			kde-base/kcachegrind
			app-editors/gvim
	   )"

