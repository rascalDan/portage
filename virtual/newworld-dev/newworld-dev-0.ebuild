EAPI="4"
DESCRIPTION="Virtual for PA New World development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X mssql odbc idea-ultimate"

RDEPEND="
	virtual/miller-base
	www-client/lynx
	www-client/chromium
	www-client/firefox
	www-client/opera
	app-text/htmltidy
	app-doc/doxygen
	media-fonts/freefont
	media-fonts/hack
	app-vim/vcscommand
	app-vim/youcompleteme
	app-vim/syntastic
	dev-libs/libxml2
	dev-java/maven-bin
	dev-java/jaxb-tools
	dev-java/oracle-jdk-bin:1.7
	dev-java/oracle-jdk-bin:1.8
	app-text/trang
	app-benchmarks/jmeter
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	odbc? ( dev-db/myodbc )
	mssql? ( dev-db/freetds )
	dev-vcs/cvs2svn
	www-servers/apache
	=dev-db/marklogic-5.0*
	dev-db/mongodb
	dev-vcs/mercurial
	dev-vcs/git
	dev-vcs/git-extras
	virtual/jdk:1.7
	www-servers/tomcat:7
	X? (
			|| ( dev-util/eclipse-sdk dev-util/eclipse-sdk-bin )
			idea-ultimate? ( dev-util/idea-ultimate )
			!idea-ultimate? ( dev-util/idea-community )
			media-gfx/gimp
			dev-db/squirrel-sql[informix,mysql]
			kde-apps/okteta
			app-editors/gvim
	   )"

