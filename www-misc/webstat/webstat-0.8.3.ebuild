EAPI=8
inherit bjam

DESCRIPTION="WebStat web site access analyser"
HOMEPAGE="https://git.randomdan.homeip.net/repo/webstat/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz
	https://github.com/hanickadot/compile-time-regular-expressions/archive/refs/tags/v3.11.0.tar.gz -> ctre-3.11.0.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-crypt/libmd
	>=dev-libs/libdbpp-1.4.10:=
	>=dev-libs/libdbpp-postgresql-1.4.10
	>=dev-libs/libadhocutil-0.9.3:="
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}
	virtual/pkgconfig
	dev-build/b2"

src_prepare() {
	default
	rmdir ${S}/thirdparty/ctre
	ln -sf ${WORKDIR}/compile-time-regular-expressions-3.11.0 ${S}/thirdparty/ctre
}

src_compile() {
	bjambuild src//webstat_logger
}

src_install() {
	bjaminstall install
}
