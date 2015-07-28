EAPI=3

DESCRIPTION="SQuirreL SQL Client is a graphical Java program that will allow you to view the structure of a JDBC compliant database, browse the data in tables, issue SQL commands etc"
HOMEPAGE="http://www.squirrelsql.org/"
SRC_URI="http://heanet.dl.sourceforge.net/project/squirrel-sql/1-stable/${PV}-plainzip/squirrelsql-3.6-optional.zip"

LICENSE="lgpl"
SLOT="0"
KEYWORDS="x86 amd64"
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

src_install() {
	mkdir -p ${D}/opt/${PN} || die "Create install dir"
	cp -R ${WORKDIR}/*-optional/* ${D}/opt/${PN}
	chmod +x ${D}/opt/${PN}/*.sh
}
