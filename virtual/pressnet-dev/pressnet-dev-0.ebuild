DESCRIPTION="Virtual for Miller development workstations"

EAPI="2"
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X dotnet"

DEPEND="virtual/miller-base
	www-client/lynx
	www-client/chromium
	|| ( www-client/firefox www-client/icecat )
	www-client/opera
	sys-devel/gdb
	dev-util/valgrind
	app-text/htmltidy
	app-doc/doxygen
	media-fonts/freefont-ttf
	app-vim/vcscommand
	dev-util/splint
	app-vim/omnicppcomplete
	dev-cpp/libxmlpp
	dev-libs/libxml2[-icu]
	media-libs/imlib2
	media-gfx/imagemagick
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	dev-db/squirrel-sql
	dev-db/myodbc
	www-servers/apache
	app-vim/tt2-syntax
	dev-java/commons-fileupload
	dev-java/jakarta-jstl
	dev-java/sun-jdk
	dev-java/sun-jre-bin
	dev-java/maven-bin
	dev-libs/omniEvents
	dev-util/eclipse-sdk
	net-misc/omniORB
	www-servers/tomcat:5.5
	X? (
		media-gfx/gimp
		dev-db/tora
		dev-util/nemiver
		kde-base/okteta
		dev-vcs/kdesvn
		dotnet? (
			dev-util/mono-debugger
			=dev-util/monodevelop-2.1*
			=dev-util/monodevelop-database-2.1*
			=dev-util/monodevelop-debugger-gdb-2.1*
		)
		kde-base/kcachegrind
		app-editors/gvim
	)"

