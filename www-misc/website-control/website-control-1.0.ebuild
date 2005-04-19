inherit eutils

DESCRIPTION="Remote website updating utility (server)"
SRC_URI="http://portage.develop.web.dot/${P}.tar.gz"
HOMEPAGE="http://develop.web.dot/"
SLOT="0"
KEYWORDS="x86"
IUSE=""
DEPEND="sys-apps/coreutils
sys-apps/sed
dev-util/cvs
app-arch/gzip
app-arch/tar
sys-devel/gdb
sys-apps/xinetd"
RESTRICT="nomirror"

#RDEPEND=""

src_compile() {
	unset ARCH
}

src_install() {
	cd ${WORKDIR}/
	chmod 700 website-control || die "Failed to set privs"
	chown root:root website-control || die "Failed to set owner"
	(mkdir -p ${D}/usr/local/sbin &&
	mkdir -p ${D}/usr/local/etc/ &&
	mkdir -p ${D}/etc/xinetd.d) || die "Failed to create file tree"
	cp website-control ${D}/usr/local/sbin/ || die "Failed to copy executable"
	cp website-control-tcp ${D}/etc/xinetd.d/ || die "Failed to copy xinetd config"
	cp website-control.qed.cfg ${D}/usr/local/etc/ || die "Failed to copy config"
}

