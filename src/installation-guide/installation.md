Arch Core Installation
======================

Steps are detailed below to install a fully functional Arch base system (as a VirtualBox
host) from which more functionality can easily be added.
Following the [Arch Beginners' Guide][BegGuide].


Boot Installation Medium
------------------------

1. Download Arch ISO image.
2. Start VM.
3. Select ISO image.


Check Internet Connection
-------------------------
Check `dhcpd` successfully set up the interface:

      ping -c 3 www.google.com


Prepare Storage Drive 
---------------------

1. Create EFI bootable partition + single GPT partition with ext4 filesystem.

    * List disks attached to the system: `lsblk`
    * Start parted on device: `parted /dev/sda`
    * In parted create:
          * GPT partition table
                
                mklabel gpt

          * EFI bootable partition
 
                mkpart ESP fat32 1MiB 513MiB
                set 1 boot on
                name 1 EFI

          * GPT partition to host whole OS + data
 
                mkpart primary ext4 513MiB 100%
                name 2 arch
    
    * Quit parted (`q`).

    * Create filesystems

                mkfs.vfat -F32 /dev/sda1
                mkfs.ext4 /dev/sda2

2. Mount partitions:
 
                mount /dev/sda2 /mnt
                mkdir -p /mnt/boot
                mount /dev/sda1 /mnt/boot
                

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

1. Chroot into newly installed system: `arch-chroot /mnt /bin/bash`

2. Locale.

    * Uncomment "`en_US.UTF-8 UTF-8`" in `/etc/locale.gen`
    * `locale-gen`
    * `echo LANG=en_US.UTF-8 > /etc/locale.conf`
    * `export LANG=en_US.UTF-8`

3. Timezone: `ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime`

4. Hardware clock: `hwclock --systohc --utc`

5. Hostname: 

        echo madematix > /etc/hostname

   Then append it to both lines in `/etc/hosts`:

        #<ip-address> <hostname.domain.org> <hostname>
        127.0.0.1 localhost.localdomain localhost madematix
        ::1   localhost.localdomain localhost madematix

6. Network: `systemctl enable dhcpcd@enp0s3.service`
   (NB interface name `enp0s3` retrieved through `ip link`.)

7. `passwd` to set root password to "`abc123`" 

8. Set up direct EFI boot (i.e. without boot loader; see [EFISTUB][EFISTUB]).
    
        cd /boot
        echo vmlinuz-linux root=/dev/sda2 initrd=/initramfs-linux.img > startup.nsh

9. Unmount partition and reboot.

    * `exit`
    * `umount -R /mnt`
    * `reboot`
    * Virtual Box -> Devices -> CD/DV -> Remove ISO image


Additional Tweaks
-----------------

1. If needed you can create a [swap file][swapF] of (e.g.) 1GB and tweak "swappiness".

    * `fallocate -l 1024M /swapfile`
    * `chmod 600 /swapfile`
    * `mkswap /swapfile`
    * `swapon /swapfile`
    * `nano /etc/fstab` to add: `/swapfile none swap defaults 0 0`
    * `nano /etc/sysctl.d/99-sysctl.conf` to add:
        + `vm.swappiness=1`
        + `vm.vfs_cache_pressure=50`

2. Pacman Mirror List: if wanted, install [Reflector][reflector] to [sort mirrors][mirrors]
   and generate it.

        pacman -S reflector
        cd /etc/pacman.d
        cp -vf mirrorlist mirrorlist.backup
        reflector --verbose -l 5 -p http --sort rate --save mirrorlist

    (The last command verbosely rates the 5 most recently synchronized HTTP servers, sorts
    them by download rate, and overwrites the file `mirrorlist`.)

3. Fix any issues.

    * `journalctl -b` (logs since boot, see [systemd][systemd] for more on journal)
    * `journalctl | grep fail`
    * `systemctl --failed`

4. Clean up packages:

        pacman -Rns $(pacman -Qdtq) 

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
3. EFI boot. Can’t use `efibootmgr` as VirtualBox won’t persist the settings after shutdown
   (see [here][VBoxArchGuest]) so we resort to using `startup.nsh’.


Known Issues
------------

1. VirtualBox `piix4_smbus` error in boot log ("SMBus base address uninitialized...") is
   due to VirtualBox not providing the SMBus and the system loading the `i2c_piix4` dirver
   which expects it on the motherboard.  Could blacklist the driver, but it seems no harm
   can be done if the driver loads, so NO ACTION required.  
   (To fix, see e.g. [here][piix4].)
2. `intel_rapl` error in boot log ("no valid rapl domains found in package 0”) is harmless,
    see e.g. [here][intel_rapl]. NO ACTION required.
3. [Fast TSC calibration failed][tscFail].  Shows up in the logs, but it's harmless, NO
   ACTION required.
4. `acpi … _OSC failed (AE_NOT_FOUND)`.  Just a warning, ignore; see e.g. [here][acpi_osc].
5. Sound card.  The driver for the sound card exposed by VirtualBox could cause an error
   of "unreliable dma position" at boot; disabling the sound card in the VM settings 
   avoids the driver being loaded and so the error.
6. Network driver.  We enabled `dhcpcd` at boot, so the network driver for the card
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

[EFISTUB]: https://wiki.archlinux.org/index.php/EFISTUB
           "EFISTUB"

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

[intel_rapl]: http://askubuntu.com/questions/449574/intel-rapl-no-valid-rapl-domains-message-upon-boot
              "intel_rapl"

[VBoxArchGuest]: https://wiki.archlinux.org/index.php/VirtualBox#Installation_steps_for_Arch_Linux_guests
                 "Installation steps for Arch Linux guests"

[acpi_osc]: http://askubuntu.com/questions/86499/error-about-acpi-osc-request-failed-ae-not-found
            "error about ACPI _OSC request failed (AE_NOT_FOUND)"
