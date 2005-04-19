inherit eutils

DESCRIPTION="Remote website updating utility (client)"
SRC_URI="http://portage.develop.web.dot/${P}.tar.gz"
HOMEPAGE="http://develop.web.dot/"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="net-analyzer/netcat sys-apps/coreutils sys-apps/grep sys-apps/sed"
RESTRICT="nomirror"

#RDEPEND=""

src_compile() {
	unset ARCH
}

src_install() {
	cd ${WORKDIR}/
	chmod 755 website-remote || die "Failed to set privs"
	chown root:root website-remote || die "Failed to set owner"
	mkdir -p ${D}/usr/local/bin || die "Failed to create file tree"
	cp * ${D}/usr/local/bin/ || die "Failed to copy"
}

