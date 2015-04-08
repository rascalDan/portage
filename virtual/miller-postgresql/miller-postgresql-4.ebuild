EAPI="4"
DESCRIPTION="Virtual for Miller PostgreSQL servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="pgmaster"

RDEPEND="
	virtual/miller-base
	=dev-db/postgresql-9.4*[server]
	=dev-db/slony1-2.2.3*
	pgmaster? ( >=dev-db/slony1-2[perl] )
"

