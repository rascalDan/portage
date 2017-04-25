# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

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

	app-arch/xz-utils
	app-text/tidy-html5
	dev-cpp/glibmm
	dev-cpp/libjsonpp
	dev-cpp/libxmlpp
	dev-cpp/slicer
	dev-db/mariadb
	dev-db/sqlite
	dev-db/unixODBC
	dev-libs/boost
	dev-libs/cgicc
	dev-libs/fcgi
	dev-libs/glib
	dev-libs/Ice
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
	sys-fs/fuse
	sys-kernel/linux-headers
	sys-libs/glibc
	sys-libs/zlib
	www-apps/project2
	www-misc/icespider
"

