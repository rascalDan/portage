EAPI="7"
DESCRIPTION="Virtual for Miller webapp servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

RDEPEND="
	virtual/miller-base
	sys-fs/netfs-gitfs
	www-apps/gentoobrowse
	www-apps/bugzilla
	www-apps/mythweb
	|| ( media-tv/mythtv media-tv/mythtv-bindings )
	virtual/httpd-php:7.2
	www-apps/cgit
	app-text/highlight
	dev-python/pygments
	dev-python/markdown
"
