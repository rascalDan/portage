EAPI=3

DESCRIPTION="Virtual for Random servers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="mediaserver"

RDEPEND="
	net-dialup/ppp
	net-dialup/pptpd
	net-dns/bind
	net-dns/ddclient
	net-firewall/iptables
	net-fs/samba
	net-misc/dhcp
	net-proxy/squid
	net-nds/smbldap-tools
	virtual/miller-base
	virtual/miller-mailserver
	virtual/miller-postgresql
	dev-db/couchdb
	virtual/miller-webappserver
	virtual/miller-webserver
	www-apps/project2
	mediaserver? (
			net-misc/minidlna
			media-tv/mythtv
			net-p2p/transmission )
"
