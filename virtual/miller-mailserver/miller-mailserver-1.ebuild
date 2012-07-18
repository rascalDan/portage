EAPI="2"
DESCRIPTION="Virtual for Miller mail servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

DEPEND="
virtual/miller-base
virtual/cron
|| ( net-mail/courier-imap mail-mta/courier )
mail-mta/exim
mail-filter/spamassassin[berkdb]
"

src_install() {
	exeinto /etc/cron.daily
	newexe "${FILESDIR}"/sa-learn sa-learn
}