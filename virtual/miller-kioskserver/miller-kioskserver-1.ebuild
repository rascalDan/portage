DESCRIPTION="Virtual for Miller kiosk servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="mail"

RDEPEND="
	virtual/miller-webserver
	virtual/miller-postgresql
	mail? ( virtual/miller-mailserver )
	sys-power/acpid
"
