EAPI=5

DESCRIPTION="IceTray and DryIce for bootstrapping and dry running IceBox services"
HOMEPAGE="http://icetray.randomdan.homeip.net/"
SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0/0"
KEYWORDS="~amd64 ~x86"
IUSE="ut"

RDEPEND="
	dev-libs/boost
	dev-libs/Ice
	dev-libs/libdbpp:=
	>=dev-libs/libadhocutil-0.3.2_beta1:=
	dev-cpp/slicer:=[db]
"
DEPEND="
	${RDEPEND}
	dev-util/boost-build
"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/icetray || die
	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release icetray $(use ut && echo dryice) -q || die
}

src_install() {
	cd ${S}/icetray || die

	setarch $(uname -m) -RL bjam ${BJAMOPTS} variant=release install $(use ut && echo installdryice) -q \
		--prefix=${D}/usr \
		--includedir=${D}/usr/include/icetray || die
}

