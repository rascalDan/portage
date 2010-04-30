initrd.cpio.lzma : initrd.cpio.gz makefile init
	gunzip -c $< | lzma -9 > $@

initrd.cpio.gz : initrd.list makefile init /usr/src/linux/usr/gen_init_cpio
	/usr/src/linux/usr/gen_init_cpio $< | gzip -1 > $@
	[ ! -c /dev/fb0 -o ! -x /sbin/fbres -o ! -x /usr/sbin/splash_geninitramfs ] || /usr/sbin/splash_geninitramfs -a $@ -r `fbres` livecd-2007.0 --no8bpp

initrd.deps.mk : initrd.list makefile /usr/src/linux/usr/gen_init_cpio
	echo -n 'initrd.cpio.gz : ' > $@
	grep "^file " $< | cut -d ' ' -f 3 | tr '\n' ' ' >> $@

/usr/src/linux/usr/gen_init_cpio :
	${MAKE} -C /usr/src/linux/usr/ gen_init_cpio

-include initrd.deps.mk

list : initrd.cpio.gz makefile
	gunzip -c $< | cpio -it | sort > $@

/boot/initrd.cpio.lzma : initrd.cpio.lzma
	cp $< $@

.PHONY : clean

clean :
	rm -f initrd.deps.mk list initrd.cpio.gz initrd.cpio.lzma
