EAPI=7

DESCRIPTION="Virtual for Random servers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="mediaserver dosfs ocfs2 ci"

RDEPEND="
	sys-apps/tuned
	=net-misc/unison-2.48*
	=dev-lang/ocaml-4.04*
	sys-devel/distcc
	app-text/highlight
	net-dns/bind
	net-firewall/iptables
	net-fs/samba
	net-misc/dhcp
	net-proxy/haproxy
	net-nds/smbldap-tools
	net-nds/shelldap
	virtual/miller-base
	virtual/miller-mailserver
	virtual/miller-postgresql
	virtual/miller-webappserver
	virtual/miller-webserver
	virtual/miller-proxy
	sys-apps/logwatch
	sys-apps/glacier2-service
	net-misc/gentoobrowse-api
	www-apps/mirrorsearch
	dev-util/ccache
	>=sys-cluster/heartbeat-3.0.6
	net-analyzer/fail2ban
	net-misc/openntpd
	net-analyzer/nagios
	net-analyzer/nrpe
	net-analyzer/check_drbd
	net-analyzer/check_haproxy_stats
	net-analyzer/check_ice
	ci? (
			virtual/ci-server
		)
	dosfs? (
			sys-fs/dosfstools
	)
	ocfs2? (
			sys-cluster/drbd-utils
			sys-apps/ocfs2-service
			sys-fs/ocfs2-tools )
	mediaserver? (
			net-misc/minidlna
			media-tv/mythtv
			x11-misc/xkeyboard-config
			media-tv/mythfs
			media-tv/p2pvr
			net-misc/youtube-dl
			net-p2p/transmission )
"
