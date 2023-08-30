# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
JAVA_PKG_IUSE="doc source"
inherit java-pkg-2 java-ant-2

DESCRIPTION="A simple PostgreSQL diff tool that is useful for schema upgrades"
HOMEPAGE="https://apgdiff.com"
SRC_URI="https://github.com/fordfrog/${PN}/archive/refs/tags/release_${PN}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.8
	>=dev-java/ant-core-1.7.0:0
	app-arch/zip:0
"
RDEPEND=">=virtual/jre-1.8"
S=${WORKDIR}/${PN}-release_${PV}

src_install() {
	java-pkg_newjar dist/${PN}-*.jar ${PN}.jar
	java-pkg_dolauncher apgdiff --jar ${PN}.jar

	use doc && java-pkg_dojavadoc dist/javadoc
	use source && java-pkg_dosrc src/main/java/*
}
