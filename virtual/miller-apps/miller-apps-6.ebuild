DESCRIPTION="Virtual for Miller servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="legacy"

DEPEND="virtual/miller-base
	net-misc/curl
	legacy? (
		dev-db/oracle-instantclient-odbc
		dev-db/oracle-instantclient-basic
		dev-java/sun-jre-bin
		dev-db/oracle-instantclient-sqlplus
		media-libs/clibpdf
		dev-db/oracle-instantclient-precomp
		)
	dev-util/kdbg
	dev-util/valgrind
	dev-util/strace
	media-gfx/imagemagick
	sys-devel/gdb
	dev-util/ctags
	dev-db/unixODBC
	media-gfx/graphviz
	dev-util/ccache"

