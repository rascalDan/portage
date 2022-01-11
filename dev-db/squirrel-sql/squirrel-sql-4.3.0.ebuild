EAPI="7"

DESCRIPTION="SQuirreL SQL Client is a graphical Java program that will allow you to view the structure of a JDBC compliant database, browse the data in tables, issue SQL commands etc"
HOMEPAGE="http://www.squirrelsql.org/"
SRC_URI="https://sourceforge.net/projects/squirrel-sql/files/1-stable/${PV}-plainzip/squirrelsql-${PV}-optional.zip"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="oracle informix postgres mysql mssql jaybird"

DEPEND="virtual/jre"
RDEPEND="${DEPEND}
	informix? ( dev-java/jdbc-informix )
	jaybird? ( dev-java/jdbc-jaybird )
	mssql? ( dev-java/jtds )
	mysql? ( dev-java/jdbc-mysql )
	oracle? ( dev-java/jdbc-oracle-bin )
	postgres? ( dev-java/jdbc-postgresql )
	"
S="${WORKDIR}/squirrelsql-${PV}-optional"

src_install() {
	insinto /opt/${PN}
	doins -r ${S}/*
	fperms +x /opt/${PN}/squirrel-sql.sh
	fperms +x /opt/${PN}/restore.sh
}

