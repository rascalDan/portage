EAPI=5

inherit bjam

DESCRIPTION="IceTray and DryIce for bootstrapping and dry running IceBox services"
HOMEPAGE="http://icetray.randomdan.homeip.net/"
SRC_URI="https://git.randomdan.homeip.net/repo/${PN}/snapshot/${P}.tar.xz"

LICENSE="GPL"
SLOT="0/b9"
KEYWORDS="~amd64 ~x86"
IUSE="ut tools"

RDEPEND="
	dev-libs/boost
	=dev-libs/Ice-3.6*
	>=dev-libs/libdbpp-1.1.4:=
	>=dev-libs/libadhocutil-0.3.3:=
	dev-cpp/slicer:=[db]
	tools? ( dev-util/boost-build )
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_compile() {
	bjambuild icetray/icetray \
		$(use tools && echo icetray/tool) \
		$(use ut && echo icetray/dryice)
}

src_install() {
	bjaminstall icetray/icetray//install-main \
		$(use tools && echo icetray/tool//install-tools) \
		$(use ut && echo icetray/dryice//install-dryice)
}

