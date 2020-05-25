# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Build and install a kernel, modules and initramfs with genkernel"
HOMEPAGE="https://git.randomdan.homeip.net/repo/portage/tree/sys-kernel/bzImage"
SRC_URI=""
RESTRICT="userpriv"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lvm mdadm dmraid +e2fs zfs btrfs iscsi +busybox cryptsetup gpg netboot"

DEPEND="
sys-kernel/gentoo-sources:=[symlink]
sys-kernel/genkernel-next[dmraid=,cryptsetup=,gpg=,iscsi=,mdadm=]
"
RDEPEND="${DEPEND}"
BDEPEND=""

enableif() {
	usex $1 --${2:-$1} --no-${2:-$1}
}

src_unpack() {
	mkdir -p ${S}
}

src_configure() {
	local cfg=$(ls -1t /etc/kernels/* | head -n 1)
	if [[ -f $cfg  ]] ; then
		einfo "Using $cfg for config..."
		cp $cfg $WORKDIR/.config || die "Failed to copy config"
	elif [[ -f /proc/config.gz ]] ; then
		einfo "Using running config..."
		zcat /proc/config.gz > $WORKDIR/.config || die "Failed to copy config"
	else
		einfo "Using default config..."
	fi
}

src_install() {
	GENKERNELOPTS="
		--kernel-outputdir=$WORKDIR
		--logfile=$TMP/genkernel.log
		--tempdir=$TMP/tmp
		--kernel-cc=/usr/lib/ccache/bin/cc
		--utils-cc=/usr/lib/ccache/bin/cc
		--bootdir=${D}/boot
		--module-prefix=${D}
		$(enableif lvm)
		$(enableif mdadm)
		$(enableif dmraid)
		$(enableif e2fs e2fsprogs)
		$(enableif zfs)
		$(enableif btrfs)
		$(enableif iscsi)
		$(enableif busybox)
		$(enableif cryptsetup luks)
		$(enableif gpg)
		$(enableif netboot)
		"

	addwrite /etc/kernels
	addwrite /var/lib/genkernel
	addwrite /etc/ld.so.cache~
	addwrite /etc/ld.so.cache
	mkdir ${D}/boot
	genkernel --no-clean $GENKERNELOPTS all
}

pkg_postinst() {
	grub-mkconfig -o /boot/grub/grub.cfg
}

