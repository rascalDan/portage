# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib eutils systemd

DESCRIPTION="Nagios Service Check Acceptor"
HOMEPAGE="http://www.nagios.org/"
SRC_URI="mirror://sourceforge/nagios/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ppc ppc64 sparc x86"
IUSE="tcpd +crypt minimal"

DEPEND="crypt? ( >=dev-libs/libmcrypt-2.5.1-r4 )
	!minimal? (
		acct-group/nagios
		acct-user/nagios
		tcpd? ( sys-apps/tcp-wrappers ) )"

RDEPEND="${DEPEND}
	!minimal? ( net-analyzer/nagios )"

src_configure() {
	use tcpd || export ac_cv_lib_wrap_main=no
	use crypt || export ac_cv_path_LIBMCRYPT_CONFIG=/bin/false

	econf \
		--localstatedir=/var/nagios \
		--sysconfdir=/etc/nagios \
		--with-nsca-user=nagios \
		--with-nsca-grp=nagios
}

src_compile() {
	emake -C src send_nsca $(use minimal || echo nsca)
}

src_install() {
	dodoc LEGAL Changelog README SECURITY

	dobin src/send_nsca

	insinto /etc/nagios
	doins "${S}"/sample-config/send_nsca.cfg

	if ! use minimal; then
		exeinto /usr/libexec
		doexe src/nsca

		insinto /etc/nagios
		doins "${S}"/sample-config/nsca.cfg

		systemd_dounit ${FILESDIR}/nsca.service
	fi
}

pkg_postinst() {
	if ! use minimal; then
		elog "If you are using the nsca daemon, remember to edit"
		elog "the config file /etc/nagios/nsca.cfg"
	fi
}
