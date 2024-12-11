# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Dependencies for running CI builds"
HOMEPAGE="http://coverage.randomdan.homeip.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE="deps-only odbc mysql postgres"

DEPEND=""
RDEPEND="
	!deps-only? (
		dev-cpp/libjsonpp
		dev-cpp/slicer
		dev-libs/icetray
		dev-libs/libadhocutil
		dev-libs/libdbpp
		mysql? (
			dev-libs/libdbpp-mysql
		)
		postgres? (
			dev-libs/libdbpp-postgresql
		)
		net-misc/gentoobrowse-api
		sys-cluster/netfs
		www-misc/icespider
	)

	sys-devel/gcc
	llvm-core/clang[static-analyzer]
	dev-util/lcov
	dev-util/cproto
	dev-util/cppcheck
	dev-util/include-what-you-use
	app-arch/xz-utils
	app-text/htmltidy
	dev-cpp/glibmm
	dev-cpp/libxmlpp
	mysql? (
		virtual/miller-mysql
		dev-db/mariadb-connector-c
	)
	postgres? (
		virtual/miller-postgresql
	)
	virtual/miller-base
	dev-db/sqlite
	odbc? (
		dev-db/unixODBC
		dev-db/psqlodbc
	)
	dev-libs/boost
	dev-libs/fcgi
	dev-libs/glib
	=dev-libs/Ice-3.7*
	dev-libs/slice-parser
	dev-libs/libevent
	dev-libs/libgcrypt
	dev-libs/libgit2
	dev-libs/libxml2
	dev-libs/libxslt
	media-libs/libsdl2
	net-libs/libesmtp
	net-misc/curl
	sys-devel/flex
	sys-fs/fuse:3
	sys-kernel/linux-headers
	sys-libs/glibc
	sys-libs/zlib
	app-text/doxygen
"

