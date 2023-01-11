EAPI="8"
DESCRIPTION="Virtual for Miller mail servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

RDEPEND="
	virtual/miller-base
	virtual/cron
	|| ( net-mail/courier-imap mail-mta/courier )
	mail-mta/exim
	mail-filter/spamassassin
"

src_unpack() {
	mkdir ${S}
}

src_install() {
	exeinto /etc/cron.daily
	newexe "${FILESDIR}"/sa-update sa-update
}
