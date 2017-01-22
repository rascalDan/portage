DESCRIPTION="Virtual for Miller web servers"

SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE=""

RDEPEND="
	virtual/miller-base
	www-servers/apache
	www-apache/Apache2-Filter-Minifier-CSS
	www-apache/Apache2-Filter-Minifier-JavaScript
	www-apache/mod_fcgid
	app-crypt/certbot
"

