# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Dependencies for running CI builds"
HOMEPAGE="http://coverage.randomdan.homeip.net/"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="
	dev-util/lcov
	dev-util/cproto
	app-arch/xz-utils
	app-text/tidy-html5
	dev-cpp/glibmm
	dev-cpp/libjsonpp
	dev-cpp/libxmlpp
	dev-cpp/slicer
	virtual/miller-mysql
	dev-db/sqlite
	dev-db/unixODBC
	dev-db/psqlodbc
	dev-libs/boost
	dev-libs/fcgi
	dev-libs/glib
	=dev-libs/Ice-3.7*
	dev-libs/icetray
	dev-libs/libadhocutil
	dev-libs/libdbpp
	dev-libs/libdbpp-mysql
	dev-libs/libdbpp-postgresql
	dev-libs/libevent
	dev-libs/libgcrypt
	dev-libs/libgit2
	dev-libs/libxml2
	dev-libs/libxslt
	net-libs/libesmtp
	net-misc/curl
	net-misc/gentoobrowse-api
	sys-cluster/netfs
	sys-devel/flex
	sys-fs/fuse:0
	sys-kernel/linux-headers
	sys-libs/glibc
	sys-libs/zlib
	www-misc/icespider
	app-doc/doxygen
"
