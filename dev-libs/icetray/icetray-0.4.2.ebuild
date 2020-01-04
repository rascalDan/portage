EAPI="7"

inherit bjam

DESCRIPTION="IceTray and DryIce for bootstrapping and dry running IceBox services"
HOMEPAGE="http://icetray.randomdan.homeip.net/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"

LICENSE="MIT"
SLOT="0/0.3"
KEYWORDS="~amd64 ~x86"
IUSE="ut tools"

RDEPEND="
	dev-libs/boost:=
	=dev-libs/Ice-3.7*
	>=dev-libs/libdbpp-1.4:=
	>=dev-libs/libadhocutil-0.7.5:=
	dev-cpp/slicer:=[db]
	net-libs/libesmtp
	tools? ( dev-util/boost-build )
"
DEPEND="
	${RDEPEND}
	dev-util/pkgconfig
	>=dev-util/boost-build-1.71
"

src_compile() {
	bjambuild icetray/icetray \
		$(use tools && echo icetray/tool) \
		$(use ut && echo icetray/dryice)
}

src_install() {
	bjaminstall icetray/icetray//install \
		$(use tools && echo icetray/tool//install) \
		$(use ut && echo icetray/dryice//install)
}

