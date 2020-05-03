# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Dependencies for running CI builds"
HOMEPAGE="http://coverage.randomdan.homeip.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE="deps-only"

DEPEND=""
RDEPEND="
	!deps-only? (
		dev-cpp/libjsonpp
		dev-cpp/slicer
		dev-libs/icetray
		dev-libs/libadhocutil
		dev-libs/libdbpp
		dev-libs/libdbpp-mysql
		dev-libs/libdbpp-postgresql
		net-misc/gentoobrowse-api
		sys-cluster/netfs
		www-misc/icespider
	)

	dev-util/lcov
	dev-util/cproto
	app-arch/xz-utils
	app-text/tidy-html5
	dev-cpp/glibmm
	dev-cpp/libxmlpp
	virtual/miller-mysql
	virtual/miller-postgresql
	virtual/miller-base
	dev-db/sqlite
	dev-db/unixODBC
	dev-db/psqlodbc
	dev-libs/boost
	dev-libs/fcgi
	dev-libs/glib
	=dev-libs/Ice-3.7*
	dev-libs/libevent
	dev-libs/libgcrypt
	dev-libs/libgit2
	dev-libs/libxml2
	dev-libs/libxslt
	net-libs/libesmtp
	net-misc/curl
	sys-devel/flex
	sys-fs/fuse:0
	sys-kernel/linux-headers
	sys-libs/glibc
	sys-libs/zlib
	app-doc/doxygen
"

