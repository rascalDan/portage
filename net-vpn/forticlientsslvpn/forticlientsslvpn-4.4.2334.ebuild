# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE="https://www.fortinet.com/"
SRC_URI="${PN}_linux_${PV}.tar.gz"

LICENSE="FortiClientSSLVPN"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE=""
RESTRICT="fetch bindist"

DEPEND="net-dialup/ppp"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"

QA_PREBUILT="
opt/forticlientsslvpn/helper/*
opt/forticlientsslvpn/forticlientsslvpn*
"

src_compile() { :; }

src_install()
{
	bits=64bit
	if [ "$ABI" != amd64 ]; then
		bits=32bit
	fi

	mkdir -p "${D}/opt" || die
	mv "${S}/${bits}" "${D}/opt/${PN}" || die
	chmod u+s "${D}/opt/${PN}/helper/subproc" || die
}

