Arch Core Installation
======================

Steps are detailed below to install a fully functional Arch base system (as a VirtualBox
host) from which more functionality can easily be added.  
Following the [Arch Beginners' Guide][BegGuide].


Boot Installation Medium
------------------------

1. Download Arch ISO image.
2. Start VM (boot will fail).
3. Devices -> CD/DV -> Select ISO image
4. Reboot VM.


Check Internet Connection
-------------------------
Check `dhcpd` successfully set up the interface:

      ping -c 3 www.google.com


Prepare Storage Drive
---------------------

1. Create single GPT partition with ext4 filesystem.

   * List disks attached to the system: `lsblk`
   * Create single GPT partition: `cgdisk /dev/sda`
   * Create filesystem: `mkfs.ext4 /dev/sda1`

2. Mount partition: `mount /dev/sda1 /mnt`

Install Base System
-------------------

1. Optionally select mirror.  (Usually not needed.)
2. `pacstrap -i /mnt base`


Generate Initial fstab
----------------------

1. `genfstab -U -p /mnt >> /mnt/etc/fstab`
2. `lsblk -f`
3. Double-check contents: `cat /mnt/etc/fstab`


Configure Base System
---------------------

1. Chroot into newly installed system: `arch-chroot /mnt`

2. Locale.   

   * Uncomment "`en_US.UTF-8 UTF-8`" in `/etc/locale.gen`
   * `locale-gen`
   * `echo LANG=en_US.UTF-8 > /etc/locale.conf`
   * `export LANG=en_US.UTF-8`

3. Timezone: `ln -s /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime`

4. Hardware clock: `hwclock --systohc --utc`

5. Hostname: `echo madematix > /etc/hostname`

6. Network: `systemctl enable dhcpcd.service`

7. `passwd` to set root password to "`abc123`" 

8. Install Syslinux boot loader.

   * `pacman -S gptfdisk`  (needed because of GPT partition)
   * `pacman -S syslinux` 
   * `syslinux-install_update -i -a -m`
   * `nano /boot/syslinux/syslinux.cfg` to change `/dev/sda3` to reflect root partition on
     both `arch` and `archfallback`; use UUID, see [Syslinux][syslinux] for details.

9. Unmount partition and reboot.

   * `exit`
   * `umount -R /mnt`
   * `reboot`
   * Virtual Box -> Devices -> CD/DV -> Remove ISO image


Additional Tweaks
-----------------

1. Create [swap file][swapF] of 1GB and tweak "swappiness".

   * `fallocate -l 1024M /swapfile`
   * `chmod 600 /swapfile`
   * `mkswap /swapfile`
   * `swapon /swapfile`
   * `nano /etc/fstab` to add: `/swapfile none swap defaults 0 0`
   * `nano /etc/sysctl.d/99-sysctl.conf` to add:
     + `vm.swappiness=1`
     + `vm.vfs_cache_pressure=50`

2. `syslinux.cfg` (see [Syslinux][syslinux])

   * Hide menu, auto-boot: set `PROMT`, `TIMEOUT` to `0`; comment out Menu Configuration
     lines
   * Bigger console: add kernel param: `vga=795` 

3. Pacman Mirror List: install [Reflector][reflector] to [sort mirrors][mirrors] and 
   generate it.

        pacman -S reflector
        cd /etc/pacman.d
        cp -vf mirrorlist mirrorlist.backup
        reflector --verbose -l 5 -p http --sort rate --save mirrorlist
   
   (The last command verbosely rates the 5 most recently synchronized HTTP servers, sorts
   them by download rate, and overwrites the file `mirrorlist`.)

4. Fix any issues.

   * `journalctl -b` (logs since boot, see [systemd][systemd] for more on journal)
   * `journalctl | grep fail`
   * systemctl --failed

5. Clean up packages:

        pacman -Rn $(pacman -Qdtq) 

   until there are no more orphans left. (This is just a sanity check as it shouldn't 
   happen at this stage.)


Notes
-----

1. Clearing of `/tmp` and `/run`.  This happens automatically when shutting down as Arch 
   uses `tmpfs` for those directories, as can be seen from: `mount | grep tmpfs`.
   See the article on [tmpfs][tmpfs] and that on the [Arch Filesystem Hierarchy][fsHiera]
   for more details.
2. [Hibernation][hiber]. If wanted, then the `resume_offset` kernel parameter has to be
   set as we're using a swap file.


Known Issues
------------

1. VirtualBox `piix4_smbus` error in boot log ("SMBus base address uninitialized...") is
   due to VirtualBox not providing the SMBus and the system loading the `i2c_piix4` dirver
   which expects it on the motherboard.  Could blacklist the driver, but it seems no harm
   can be done if the driver loads, so NO ACTION required.  
   (To fix, see e.g. [here][piix4].)
2. [Fast TSC calibration failed][tscFail].  Shows up in the logs, but it's harmless, NO
   ACTION required.
3. Sound card.  The driver for the sound card exposed by VirtualBox could cause an error
   of "unreliable dma position" at boot; disabling the sound card in the VM settings 
   avoids the driver being loaded and so the error.
4. Network driver.  We enabled `dhcpcd` at boot, so the network driver for the card
   simulated by VirtualBox needs to bring up the network interface before `dhcpcd`
   attempts to get a lease.  This seems to be the case currently; in the past, there were
   issues (probably due to asynchronous processing by `systemd`) where sometimes `dhcpcd`
   would fail at boot because the network interface wasn't yet available.  To solve it,
   explicitly load the driver.  (Used to be `e1000` driver specified in 
   `/etc/modules-load.d/e1000.conf`.)




[BegGuide]: https://wiki.archlinux.org/index.php/Beginners'_Guide
	    "Arch Beginners' Guide"

[tmpfs]: https://wiki.archlinux.org/index.php/Fstab#tmpfs
	 "tmpfs"

[fsHiera]: https://wiki.archlinux.org/index.php/Arch_filesystem_hierarchy
	   "Arch Filesystem Hierarchy"

[syslinux]: https://wiki.archlinux.org/index.php/syslinux
	    "Syslinux"

[piix4]: http://fintastical.blogspot.com/2010/11/virtualbox-piix4smbus-error.html
	 "VirtualBox piix4_smbus Error"

[systemd]: https://wiki.archlinux.org/index.php/systemd
	   "systemd"

[swapF]: https://wiki.archlinux.org/index.php/Swapfile#Swap_file
	 "Swap File"

[hiber]: https://wiki.archlinux.org/index.php/Suspend_and_Hibernate
	 "Suspend and Hibernate"

[tscFail]: https://bbs.archlinux.org/viewtopic.php?id=150096
	   "Fast TSC calibration failed"

[reflector]: https://wiki.archlinux.org/index.php/Reflector
	     "Reflector"

[mirrors]: https://wiki.archlinux.org/index.php/Mirrors
	   "Mirrors"