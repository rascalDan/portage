EAPI="4"
DESCRIPTION="Virtual for PA New World development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X odbc"

RDEPEND="
	virtual/miller-base
	www-client/lynx
	www-client/chromium
	www-client/firefox
	www-client/opera
	app-text/htmltidy
	app-doc/doxygen
	media-fonts/freefont
	app-vim/vcscommand
	app-vim/omnicppcomplete
	dev-libs/libxml2
	dev-java/maven-bin
	app-shells/gentoo-bashcomp
	app-arch/rar
	net-ftp/ftp
	odbc? ( dev-db/myodbc )
	www-servers/apache
	~dev-db/marklogic-5.0
	dev-vcs/mercurial
	virtual/jdk:1.7
	X? (
			|| ( dev-util/eclipse-sdk dev-util/eclipse-sdk-bin )
			dev-util/idea-community
			media-gfx/gimp
			dev-db/squirrel-sql[informix,mysql]
			kde-base/okteta
			app-editors/gvim
	   )"

