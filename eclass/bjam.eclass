# Distributed under the terms of the GNU General Public License v2

# @ECLASS: bjam.eclass
# @MAINTAINER:
# randomdan
# @AUTHOR:
# randomdan
# @BLURB: 
# @DESCRIPTION:

inherit

src_configure() {
	ebegin "Setting portage CXX and LD flags"
	sed -i "s|^using gcc .*|using gcc : : : <compileflags>\"${CXXFLAGS}\" <linkflags>\"${LDFLAGS}\" ;|" ${S}/Jamroot.jam
	eend $?

	ebegin "Applying macro replacements"
	env | sed "s/^/-D'/;s/$/'/" | xargs m4 /dev/null -F "${TMPDIR}/m4.env"
	find "${S}" -name "*.in" | while read infile ; do
		m4 -R "${TMPDIR}/m4.env" "${infile}" > "${infile%.in}"
	done
	eend $?
}

src_test() {
	bjambuild
}

bjambuild() {
	setarch $(uname -m) -RL b2 -l600 ${BJAMOPTS} variant=release -q $@ || die
}

bjaminstall() {
	local -a other
	local include
	include=${PN}
	while [[ $# -gt 0 ]] ; do
		case "$1" in
			-i|--include)
				include=$2
				shift
				;;
			*)
				other+=( $1 )
				;;
		esac
		shift
	done

	bjambuild \
		--prefix="${D}/usr" \
		--libdir="${D}/usr/$(get_libdir)" \
		--includedir="${D}/usr/include/$include" \
		${other[@]}

	insinto /usr/share/pkgconfig
	find "${S}" -name "*.pc" | while read infile ; do
		doins ${infile}
	done
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

