EAPI="7"
DESCRIPTION="Virtual for Miller PostgreSQL servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

RDEPEND="
	virtual/miller-base
	dev-db/pg_activity
	sys-cluster/resource-agents-paf
	=dev-db/postgresql-14*[server]
"
