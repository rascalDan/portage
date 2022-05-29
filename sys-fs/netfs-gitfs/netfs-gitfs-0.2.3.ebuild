EAPI="7"

inherit bjam

DESCRIPTION="NetFS daemon for exposing Git repositories"
HOMEPAGE="http://netfs.randomdan.homeip.net/git"

SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	dev-libs/boost:=
	>=dev-libs/icetray-0.4:=
	dev-libs/libgit2
	=sys-cluster/netfs-1.5*
	>=dev-libs/libadhocutil-0.7.5:=
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	dev-util/boost-build
"

src_compile() {
	bjambuild src
}

src_install() {
	bjaminstall install
}

