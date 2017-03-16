EAPI="5"

DESCRIPTION="Tools and libraries for building web services/sites that are clients of ICE services"
HOMEPAGE="http://icespider.randomdan.homeip.net/"

SRC_URI="http://releases.randomdan.homeip.net/git/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0/0.1"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-libs/Ice
	dev-libs/libadhocutil
	dev-cpp/slicer:=
	dev-libs/fcgi
	dev-libs/boost"
DEPEND="${DEPEND}
	dev-util/boost-build"

src_prepare() {
	sed -ie "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
}

src_compile() {
	cd ${S}/icespider || die
	setarch $(uname -m) -RL b2 -q ${BJAMOPTS} variant=release \
		common core compile fcgi xslt fileSessions testing || die
}

src_install() {
	cd ${S}/icespider || die
	setarch $(uname -m) -RL b2 -q ${BJAMOPTS} variant=release --prefix=${D}/usr --includedir=/${D}/usr/include/icespider \
		install \
		install-ice \
		install-tools || die
}

