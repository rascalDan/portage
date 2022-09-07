# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Stream audio between your devices"
HOMEPAGE="https://audiorelay.net/"
SRC_URI="https://dl.audiorelay.net/setups/linux/${P}.tar.gz"

LICENSE="AudioRelay"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
media-sound/pulseaudio
media-sound/pulseaudio-ctl
dev-java/openjdk:17
"
RDEPEND="${DEPEND}"
BDEPEND=""
S=${WORKDIR}

src_install() {
	exeinto /opt/${PN}/bin
	doexe bin/AudioRelay
	insinto /opt/${PN}/lib/app
	doins lib/app/*.jar
	doins lib/app/AudioRelay.cfg
	exeinto /opt/${PN}/lib/runtime/bin
	doexe lib/runtime/bin/*
	exeinto /opt/${PN}/lib
	doexe lib/*.so
	dosym /usr/lib64/openjdk-17/lib /opt/${PN}/lib/runtime/lib
	dolib.so lib/runtime/lib/libnative-*.so
}
