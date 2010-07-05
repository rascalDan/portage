EAPI=2
inherit eutils versionator autotools

DESCRIPTION="ODBC driver for PostgreSQL"
HOMEPAGE="http://psqlodbc.projects.postgresql.org/"
SRC_URI="http://wwwmaster.postgresql.org/redir/170/h/odbc/versions/src/psqlodbc-${PV}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="amd64 ppc x86"
SLOT="8"
IUSE=""
DEPEND=">=dev-db/postgresql-base-8.4
		 dev-db/unixODBC"

src_install()
{
	exeinto /usr/lib
	doexe ${S}/.libs/psqlodbcw.so
}
