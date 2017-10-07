EAPI="4"
DESCRIPTION="Virtual for Miller PostgreSQL servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="cluster"

RDEPEND="
	virtual/miller-base
	=dev-db/postgresql-10*[server]
"

