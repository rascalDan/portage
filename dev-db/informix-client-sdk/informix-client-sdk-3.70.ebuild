# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="IBM® Informix® Client Software Development Kit (CSDK) offers a single packaging of several APIs that are optimized for developing applications for Informix servers."
HOMEPAGE="www.ibm.com/software/products/en/csdk/"
SRC_URI="file://localhost/clientsdk.3.70.FC4DE.LINUXx86.tar"

LICENSE="Informix"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+esql cxx odbc lmi tools"

DEPEND=""
RDEPEND="${DEPEND}"
RESTRICT="fetch"

src_unpack() {
	mkdir -p ${S}
	tar -xf ${DISTDIR}/${A} -C ${S}
}

src_compile() {
	cd ${S} || die
	touch opts || die

	FEATURES="SDK,GLS"
	use cxx && FEATURES="$FEATURES,SDK-CPP"
	use esql && FEATURES="$FEATURES,SDK-ESQL,SDK-ESQL-ACM"
	use odbc && FEATURES="$FEATURES,SDK-ODBC"
	use lmi && FEATURES="$FEATURES,SDK-LMI"
	use tools && FEATURES="$FEATURES,DBA-DBA"

	echo "LICENSE_ACCEPTED=TRUE" >> opts
	echo "USER_INSTALL_DIR=${D}/opt/informix" >> opts
	echo "CHOSEN_FEATURE_LIST=$FEATURES" >> opts
	echo "CHOSEN_INSTALL_FEATURE_LIST=$FEATURES" >> opts
	echo "CHOSEN_INSTALL_SET=Custom" >> opts
}

src_install() {
	cd ${S} || die
	addpredict /var/.com.zerog.registry.xml
	./installclientsdk -i silent -f opts || die
	insinto /etc/env.d
	newins "${FILESDIR}/env.d-3.70" "99informix"
}

