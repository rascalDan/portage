# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit linux-info

DESCRIPTION="Build and install a kernel, modules and initramfs with genkernel"
HOMEPAGE="https://git.randomdan.homeip.net/repo/portage/tree/sys-kernel/bzImage"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lvm mdadm dmraid +e2fs zfs btrfs iscsi +busybox cryptsetup gpg netboot"

DEPEND="
sys-kernel/gentoo-sources:=
sys-kernel/genkernel-next[dmraid=,cryptsetup=,gpg=,iscsi=,mdadm=]
"
RDEPEND=""
BDEPEND="${DEPEND}"

enableif() {
	usex $1 --${2:-$1} --no-${2:-$1}
}

src_prepare() {
	if [[ -z ${KBUILD_OUTPUT} ]] ; then
		die "KBUILD_OUTPUT must be set"
	fi
	default
}

src_unpack() {
	mkdir -p ${S}
}

src_configure() {
	local cfg=$(ls -1t /etc/kernels/* | head -n 1)
	if [[ -f $cfg  ]] ; then
		einfo "Using $cfg for config..."
		cp $cfg ${S}/.config || die "Failed to copy config"
	elif [[ -f /proc/config.gz ]] ; then
		einfo "Using running config..."
		zcat /proc/config.gz > ${S}/.config || die "Failed to copy config"
	else
		ewarn "Using default config..."
	fi
	einfo "Building $KV_FULL"

	GENKERNELOPTS="
		--kerneldir=${KERNEL_DIR}
		--kernel-outputdir=${S}
		--logfile=${TMP}/genkernel.log
		--tempdir=${TMP}/genkernel
		--bootdir=${D}/boot
		--firmware-dst=${D}/lib/firmware
		--module-prefix=${D}
		--no-save-config
		--no-clean
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
	einfo "Base genkernel options ${GENKERNELOPTS}"
	set_arch_to_kernel
}

src_compile() {
	genkernel $GENKERNELOPTS --no-install kernel || die genkernel failed
}

src_install() {
	insinto /etc/kernels
	newins .config ${KV_FULL}

	addwrite /etc/ld.so.cache~
	addwrite /etc/ld.so.cache
	mkdir ${D}/boot
	genkernel $GENKERNELOPTS --install all || die genkernel failed
	emake -C ${KERNEL_DIR} O=${S} clean

	dosym ${KBUILD_OUTPUT} /lib/modules/${KV_FULL}/build
	insinto ${KBUILD_OUTPUT}
	doins -r .config Module.symvers include
	insinto ${KBUILD_OUTPUT}/arch
	doins -r arch/${ARCH}
	exeinto ${KBUILD_OUTPUT}/tools/objtool
	doexe tools/objtool/objtool
	exeinto ${KBUILD_OUTPUT}/scripts
	doexe scripts/kallsyms
	exeinto ${KBUILD_OUTPUT}/scripts/basic
	doexe scripts/basic/fixdep
	exeinto ${KBUILD_OUTPUT}/scripts/kconfig
	doexe scripts/kconfig/conf
	exeinto ${KBUILD_OUTPUT}/scripts/mod
	doexe scripts/mod/mk_elfconfig scripts/mod/modpost
}

pkg_postinst() {
	grub-mkconfig -o /boot/grub/grub.cfg
}

