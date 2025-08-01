EAPI=8

DESCRIPTION="Virtual for Random servers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm ia64 mips ppc ppc-macos sparc sparc-fbsd x86 x86-fbsd"
IUSE="mediaserver dosfs ocfs2 glusterfs ci mysql postgres"

RDEPEND="
	=net-misc/unison-2.53*
	sys-devel/distcc
	sys-devel/gcc:12[cxx]
	sys-devel/gcc:13[cxx]
	sys-devel/gcc:14[cxx]
	llvm-core/clang:18
	llvm-core/clang:19
	net-dns/bind
	net-firewall/iptables
	net-fs/autofs
	net-fs/samba
	net-misc/dhcp
	net-proxy/haproxy
	net-proxy/haproxy-load-daemon
	net-nds/smbldap-tools
	net-nds/shelldap
	virtual/miller-base
	virtual/miller-mailserver
	postgres? (
		virtual/miller-postgresql
	)
	mysql? (
		virtual/miller-mysql
	)
	virtual/miller-webappserver
	virtual/miller-webserver
	virtual/miller-proxy
	sys-apps/logwatch
	sys-apps/glacier2-service
	net-misc/gentoobrowse-api
	www-apps/mirrorsearch
	dev-util/ccache
	sys-cluster/pacemaker
	sys-process/at
	sys-cluster/crmsh
	net-analyzer/fail2ban
	net-misc/openntpd
	net-analyzer/nagios
	net-analyzer/nagiosgraph
	net-analyzer/nsca
	net-analyzer/nagios-plugin-check_raid
	sys-apps/lm-sensors
	net-analyzer/nagios-plugin-check_lm_sensors
	net-analyzer/nrpe
	net-analyzer/check_crm
	net-analyzer/check_drbd
	sys-cluster/drbd-utils
	net-analyzer/check_haproxy_stats
	net-analyzer/check_ice
	net-analyzer/check_service
	net-p2p/transmission
	ci? (
			virtual/ci-server
		)
	dosfs? (
			sys-fs/dosfstools
	)
	ocfs2? (
			sys-apps/ocfs2-service
			sys-fs/ocfs2-tools )
	glusterfs? (
			sys-cluster/glusterfs )
	mediaserver? (
			net-misc/minidlna
			net-misc/yt-dlp
			)
"
