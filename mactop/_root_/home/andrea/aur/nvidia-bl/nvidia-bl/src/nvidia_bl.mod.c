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

MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro3,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro3,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro4,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook5,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook5,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookAir2,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,2*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,3*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,4*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro5,5*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook6,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBook7,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookPro7,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookAir3,1*:");
MODULE_ALIAS("dmi*:svn*AppleInc.*:pn*MacBookAir3,2*:");
MODULE_ALIAS("dmi*:svn*SonyCorporation*:pn*VGN-AW11*:");
MODULE_ALIAS("dmi*:svn*SonyCorporation*:pn*VGN-FZ38M*:");
MODULE_ALIAS("dmi*:svn*SonyCorporation*:pn*VGN-FZ11E*:");
MODULE_ALIAS("dmi*:svn*SonyCorporation*:pn*VPCCW27FX*:");
MODULE_ALIAS("dmi*:svn*SonyCorporation*:pn*VPCCW21FX*:");
MODULE_ALIAS("dmi*:svn*SonyCorporation*:pn*VPCCW2S1E*:");
MODULE_ALIAS("dmi*:svn*DellInc.*:pn*Inspiron1370*:");
MODULE_ALIAS("dmi*:svn*DellInc.*:pn*Vostro3500*:");
MODULE_ALIAS("dmi*:svn*TOSHIBA*:pn*SATELLITEPROU500*:");
