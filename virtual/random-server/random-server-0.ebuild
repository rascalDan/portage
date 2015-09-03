EAPI=3

DESCRIPTION="Virtual for Random servers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="mediaserver ocfs2"

RDEPEND="
	=net-misc/unison-2.48*
	=dev-lang/ocaml-4.02*
	net-dns/bind
	net-dns/ddclient
	net-firewall/iptables
	net-fs/samba
	net-misc/dhcp
	net-proxy/squid
	net-nds/smbldap-tools
	net-nds/shelldap
	virtual/miller-base
	virtual/miller-mailserver
	virtual/miller-postgresql
	virtual/miller-webappserver
	virtual/miller-webserver
	www-apps/project2
	sys-apps/logwatch
	ocfs2? (
			sys-cluster/drbd
			sys-fs/ocfs2-tools )
	mediaserver? (
			net-misc/minidlna
			media-tv/mythtv
			media-tv/p2pvr
			net-misc/youtube-dl
			net-p2p/transmission )
"
