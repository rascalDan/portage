# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/pgadmin3/pgadmin3-1.10.2.ebuild,v 1.1 2010/03/17 20:53:22 patrick Exp $

EAPI="1"

WX_GTK_VER="2.8"

inherit wxwidgets eutils autotools

KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86 ~x86-fbsd"

DESCRIPTION="wxWidgets GUI for PostgreSQL."
HOMEPAGE="http://www.pgadmin.org/"
Pnv="pgadmin3-1.12.0-beta2"
SRC_URI="http://wwwmaster.postgresql.org/redir/170/h/pgadmin3/release/v1.12.0-beta2/src/${Pnv}.tar.gz"
LICENSE="Artistic"
SLOT="0"
IUSE="debug"

DEPEND="x11-libs/wxGTK:2.8
	virtual/postgresql-base
	>=dev-libs/libxml2-2.5
	>=dev-libs/libxslt-1.1"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}/${Pnv}"
	epatch "${FILESDIR}/1.12.0-as_needed_ssl_detect_broken.patch"
	eautoreconf
}

src_compile() {
	einfo "${WORKDIR}/${Pnv}"
	cd "${WORKDIR}/${Pnv}"
	econf \
		--with-wx-version=2.8 \
		$(use_enable debug)
	emake || die "emake failed"
}

src_install() {
	cd "${WORKDIR}/${Pnv}"
	emake DESTDIR="${D}" install || die "einstall failed"

	insinto /usr/share/pixmaps
	newins "pgadmin/include/images/elephant48.xpm" pgadmin3.xpm

	insinto /usr/share/pgadmin3
	newins "pgadmin/include/images/elephant48.xpm" pgadmin3.xpm

	insinto /usr/share/applications
	doins "pkg/pgadmin3.desktop"

	# Fixing world-writable files
	chmod -R go-w "${D}/usr/share"
}
