cmd_/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.o := gcc -Wp,-MD,/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/.wl_iw.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-unknown-linux-gnu/4.6.2/include -I/usr/src/linux-3.1.6-1-ARCH/arch/x86/include -Iarch/x86/include/generated -Iinclude  -include /usr/src/linux-3.1.6-1-ARCH/include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -m64 -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time -maccumulate-outgoing-args -fstack-protector -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -Wframe-larger-than=2048 -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO -DUSE_CFG80211 -I/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/include -I/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys -I/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/phy  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(wl_iw)"  -D"KBUILD_MODNAME=KBUILD_STR(wl)" -c -o /home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/.tmp_wl_iw.o /home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.c

source_/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.o := /home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.c

deps_/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.o := \
  /usr/src/linux-3.1.6-1-ARCH/include/linux/kconfig.h \
    $(wildcard include/config/h.h) \
    $(wildcard include/config/.h) \
    $(wildcard include/config/foo.h) \

/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.o: $(deps_/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.o)

$(deps_/home/andrea/aur/broadcom-wl/broadcom-wl/src/src/wl/sys/wl_iw.o):
