DESCRIPTION="Virtual for Miller PostgreSQL servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""
EAPI="2"

DEPEND="
virtual/miller-base
=dev-db/postgresql-server-9.1*
>=dev-db/slony1-2[perl]
"

