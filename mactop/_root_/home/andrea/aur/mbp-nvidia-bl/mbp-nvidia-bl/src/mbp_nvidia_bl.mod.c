#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook1,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook2,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook3,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook4,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook4,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro1,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro1,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro2,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro2,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro3,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro3,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro4,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookAir1,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook5,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook5,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook6,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook7,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookAir2,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,3*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,4*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,5*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro6,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro6,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro7,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookAir3,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookAir3,2*:");
