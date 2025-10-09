EAPI=8
inherit bjam

DESCRIPTION="WebStat web site access analyser	"
HOMEPAGE="https://git.randomdan.homeip.net/repo/webstat/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz
	https://github.com/eliaskosunen/scnlib/archive/refs/tags/v4.0.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-libs/libdbpp-1.4.10:=
	>=dev-libs/libdbpp-postgresql-1.4.10
	>=dev-libs/libadhocutil-0.9.3:="
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}
	virtual/pkgconfig
	dev-build/b2"

src_prepare() {
	default
	rmdir ${S}/thirdparty/scnlib
	ln -sf ${WORKDIR}/scnlib-4.0.1 ${S}/thirdparty/scnlib
}

src_compile() {
	bjambuild src//webstat_logger
}

src_install() {
	bjaminstall install
}
