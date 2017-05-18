# Distributed under the terms of the GNU General Public License v2

# @ECLASS: bjam.eclass
# @MAINTAINER:
# randomdan
# @AUTHOR:
# randomdan
# @BLURB: 
# @DESCRIPTION:

src_prepare() {
	ebegin "Setting portage CXX and LD flags"
	sed -i "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
	eend $?
}

bjambuild() {
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release -q $@
}

