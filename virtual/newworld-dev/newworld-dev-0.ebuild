EAPI="4"
DESCRIPTION="Virtual for PA New World development workstations"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="X mssql odbc idea-ultimate"

RDEPEND="
	virtual/miller-base
	www-client/lynx
	|| ( www-client/google-chrome ( www-client/chromium www-plugins/chrome-binary-plugins ) )
	|| ( www-client/firefox www-client/firefox-bin )
	www-client/opera
	app-text/tidy-html5
	app-doc/doxygen
	media-fonts/freefont
	media-fonts/hack
	app-vim/vcscommand
	app-vim/youcompleteme
	app-vim/syntastic
	app-vim/gitgutter
	dev-libs/libxml2
	dev-db/redis
	virtual/mysql
	dev-db/postgresql:9.4
	net-libs/nodejs[npm]
	dev-java/maven-bin
	dev-java/oracle-jdk-bin:1.8
	dev-util/visualvm
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
	sys-cluster/zookeeper-bin
	sys-cluster/zookeepercli
	net-misc/rabbitmq-server
	X? (
			idea-ultimate? ( dev-util/idea-ultimate )
			!idea-ultimate? ( dev-util/idea-community )
			media-gfx/gimp
			dev-db/squirrel-sql[informix,mysql]
			kde-apps/okteta
			app-editors/gvim
	   )"

