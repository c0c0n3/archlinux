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

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x5e74aae9, "module_layout" },
	{ 0xe90dcae0, "__request_module" },
	{ 0x70b38806, "kmalloc_caches" },
	{ 0x5a34a45c, "__kmalloc" },
	{ 0x8a730634, "wiphy_free" },
	{ 0x4c4fef19, "kernel_stack" },
	{ 0x2b200864, "_raw_spin_unlock" },
	{ 0x349cba85, "strchr" },
	{ 0x3ec8886f, "param_ops_int" },
	{ 0x1574c0b9, "del_timer" },
	{ 0x25ec1b28, "strlen" },
	{ 0x51cc303c, "dev_set_drvdata" },
	{ 0x9c64fbd, "ieee80211_frequency_to_channel" },
	{ 0xbdebe9b2, "send_sig" },
	{ 0xfe86812d, "cfg80211_inform_bss_frame" },
	{ 0xa6d50910, "pci_disable_device" },
	{ 0xc7a4fbed, "rtnl_lock" },
	{ 0x87a45ee9, "_raw_spin_lock_bh" },
	{ 0x5b1c423a, "skb_clone" },
	{ 0xf89843f9, "schedule_work" },
	{ 0x670c0597, "down_interruptible" },
	{ 0xfd22b99b, "remove_proc_entry" },
	{ 0x8b7fe311, "kmemdup" },
	{ 0x415524c6, "filp_close" },
	{ 0x7513e94e, "ieee80211_channel_to_frequency" },
	{ 0x11f825a, "x86_dma_fallback_dev" },
	{ 0x9e1bdc28, "init_timer_key" },
	{ 0x3c2c5af5, "sprintf" },
	{ 0xf079b2bd, "kthread_create_on_node" },
	{ 0x7d11c268, "jiffies" },
	{ 0xe2d5255a, "strcmp" },
	{ 0x810b3618, "param_ops_string" },
	{ 0x92191ee9, "netif_rx" },
	{ 0x4f8b5ddb, "_copy_to_user" },
	{ 0xad1b2893, "kernel_read" },
	{ 0xc333500d, "pci_set_master" },
	{ 0xde0bdcff, "memset" },
	{ 0xa772d22c, "__ieee80211_get_channel" },
	{ 0xee6efb8, "dev_alloc_skb" },
	{ 0x753705e2, "pci_restore_state" },
	{ 0x88941a06, "_raw_spin_unlock_irqrestore" },
	{ 0x7038fb4c, "cfg80211_get_bss" },
	{ 0x27e1a049, "printk" },
	{ 0x6142950, "kthread_stop" },
	{ 0x2fa5a500, "memcmp" },
	{ 0xd2b362b4, "wiphy_unregister" },
	{ 0xfaef0ed, "__tasklet_schedule" },
	{ 0x7ec9bfbc, "strncpy" },
	{ 0xeb7d2c67, "register_netdev" },
	{ 0xb4390f9a, "mcount" },
	{ 0x6f5427, "_raw_spin_unlock_irq" },
	{ 0x85abc85f, "strncmp" },
	{ 0x16305289, "warn_slowpath_null" },
	{ 0x874ec8c3, "pci_bus_write_config_dword" },
	{ 0x6841197, "skb_push" },
	{ 0x81ea9e3b, "cfg80211_connect_result" },
	{ 0x38979965, "cfg80211_michael_mic_failure" },
	{ 0x9545af6d, "tasklet_init" },
	{ 0x71205378, "add_timer" },
	{ 0x2072ee9b, "request_threaded_irq" },
	{ 0x622d437e, "skb_pull" },
	{ 0xb0807c7e, "cfg80211_ibss_joined" },
	{ 0x257f581a, "dev_kfree_skb_any" },
	{ 0xd79b5a02, "allow_signal" },
	{ 0x82072614, "tasklet_kill" },
	{ 0xfd9f5a1, "lib80211_get_crypto_ops" },
	{ 0xc6cbbc89, "capable" },
	{ 0x9f984513, "strrchr" },
	{ 0x78764f4e, "pv_irq_ops" },
	{ 0xf2dc034a, "cfg80211_roamed" },
	{ 0x4d6a868c, "cfg80211_put_bss" },
	{ 0x58c39d3f, "wiphy_new" },
	{ 0x42c8de35, "ioremap_nocache" },
	{ 0xf62fe803, "wiphy_register" },
	{ 0xf4231ce3, "pci_bus_read_config_dword" },
	{ 0x6223cafb, "_raw_spin_unlock_bh" },
	{ 0xf0fdf6cb, "__stack_chk_fail" },
	{ 0x1000e51, "schedule" },
	{ 0xf333a2fb, "_raw_spin_lock_irq" },
	{ 0x3c138271, "alloc_netdev_mqs" },
	{ 0x2c0508b3, "eth_type_trans" },
	{ 0xf10939cd, "create_proc_entry" },
	{ 0x217b66e6, "wake_up_process" },
	{ 0xcf429da, "pci_unregister_driver" },
	{ 0x92c71388, "ether_setup" },
	{ 0x5755f123, "cfg80211_disconnected" },
	{ 0xd7a575d5, "kmem_cache_alloc_trace" },
	{ 0x6443d74d, "_raw_spin_lock" },
	{ 0x587c70d8, "_raw_spin_lock_irqsave" },
	{ 0xe52947e7, "__phys_addr" },
	{ 0x35b0650f, "vsnprintf" },
	{ 0xf6ebc03b, "net_ratelimit" },
	{ 0xe765252e, "pci_set_power_state" },
	{ 0xd2965f6f, "kthread_should_stop" },
	{ 0x37a0cba, "kfree" },
	{ 0x236c8c64, "memcpy" },
	{ 0xedc03953, "iounmap" },
	{ 0x57b09822, "up" },
	{ 0xa56339c0, "__pci_register_driver" },
	{ 0x6b0663e8, "unregister_netdev" },
	{ 0xafac7eef, "__netif_schedule" },
	{ 0xa3a5be95, "memmove" },
	{ 0x36348d53, "consume_skb" },
	{ 0xbec68120, "cfg80211_scan_done" },
	{ 0x2d0f2b64, "skb_put" },
	{ 0x7b34d7f2, "pci_enable_device" },
	{ 0x4f6b400b, "_copy_from_user" },
	{ 0x954cbb26, "vsprintf" },
	{ 0x40cb9be8, "dev_get_drvdata" },
	{ 0x6e720ff2, "rtnl_unlock" },
	{ 0x9e7d6bd0, "__udelay" },
	{ 0x7e25021c, "dma_ops" },
	{ 0xf20dabd8, "free_irq" },
	{ 0x59eff8cd, "pci_save_state" },
	{ 0xe914e41e, "strcpy" },
	{ 0xecf1b2b8, "filp_open" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=cfg80211,lib80211";

MODULE_ALIAS("pci:v000014E4d00004311sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004312sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004313sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004315sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004328sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004329sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d0000432Asv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d0000432Bsv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d0000432Csv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d0000432Dsv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004353sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d0000A99Dsv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004357sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004727sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004358sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00004359sv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d0000435Asv*sd*bc*sc*i*");
MODULE_ALIAS("pci:v000014E4d00000576sv*sd*bc*sc*i*");
