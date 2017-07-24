# Distributed under the terms of the GNU General Public License v2

# @ECLASS: bjam.eclass
# @MAINTAINER:
# randomdan
# @AUTHOR:
# randomdan
# @BLURB: 
# @DESCRIPTION:

inherit eutils

src_prepare() {
	ebegin "Setting portage CXX and LD flags"
	sed -i "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
	eend $?
}

src_test() {
	bjambuild
}

bjambuild() {
	setarch $(uname -m) -RL b2 ${BJAMOPTS} variant=release -q $@ || die
}

doxygenbuild() {
	mkdir -p ${D}/usr/share/man
	find ${S} -name Doxyfile -printf '%h %p\n' | while read d p ; do
		ebegin "Building documentation in $d"
		sed -i 's/^\(GENERATE_\w*\).*/\1 = NO/' "$p"
		echo OUTPUT_DIRECTORY = ${D}/usr/share >> "$p"
		echo PROJECT_NUMBER = ${PV} >> "$p"
		echo GENERATE_MAN = YES >> "$p"
		( cd "$d" && doxygen )
		eend 0
	done
}

