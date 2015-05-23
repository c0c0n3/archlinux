Installation Guide
==================

This guide details how to install my Arch as a guest in Virtual Box.
Follow the instructions in the below sequence:
 
  1. [Creating the Virtual Machine](create-vm.html "Creating the Virtual Machine")
  2. [Arch Core Installation](installation.html "Arch Core Installation") 
  3. [Desktop Foundation](desktop-foundation.html "Desktop Foundation")
  4. [Lightweight Desktop](lightweight-desktop.html "Lightweight Desktop")
  5. [VirtualBox Host Setup](vbox-host.html "VirtualBox Host Setup")
  6. [Backups](backups.html "Backups")
  7. [Customizations](customizations.html "Customizations")
  8. [Base Development Environment](base-dev-env.html "Base Development Environment") 

Take a VM snapshot at each step, after having checked the system is healthy.
After completing the steps in Base Development Environment, do a final system check
(run as `root`):
        
        journalctl -b
        systemctl --failed
        grep EE /var/log/Xorg.0.log
        grep WW /var/log/Xorg.0.log
        grep -i err /var/log/pacman.log
        pacman -Qdt
        find / -name '.pac*'

If all is OK, delete all cached packages before taking a final snapshot: 

        pacman -Scc

Note that normally you wouldn't do this, but it makes sense here because we don't want
to keep 1GB of packages in the snapshot; the cache will be repopulated as you upgrade
the system. At this point it's probably a good idea to shrink the VBox HD too; this can
be done from time to time if you realize that the used HD space inside the VM as shown
by

        df -h /dev/sda1 /dev/sda2

happens to be much less than the size of the VBox virtual HD file on the host. (This
can happen because we created the virtual drive as dynamic.)  To shrink it, we first
need to zero out all the available free space in the Arch guest as VBox will only
remove zeroed blocks:

        dd if=/dev/zero of=junk
        sync
        rm junk

Then shut down the VM, `cd` into the VM directory on the host, and run:

        VBoxManage modifyhd --compact madematix.hd.vdi

More info [here][shrink-vbox], [here][compact-vdi], and [here][mk-ext4-sparse].

To keep the system in good shape, refer to the [Arch General Recommendations][arch-gen-rec],
especially to the System Maintenance pages listed in the [System Administration][arch-sys-adm]
section.




[arch-gen-rec]: https://wiki.archlinux.org/index.php/General_Recommendations
                "Arch General Recommendations"

[arch-sys-adm]: https://wiki.archlinux.org/index.php/General_Recommendations#System_administration
                "Arch System Administration"

[shrink-vbox]: http://dantwining.co.uk/2011/07/18/how-to-shrink-a-dynamically-expanding-guest-virtualbox-image/
               "How to shrink a dynamically-expanding guest virtualbox image"

[compact-vdi]: http://superuser.com/questions/529149/how-to-compact-virtualboxs-vdi-file-size
               "How to compact VirtualBox's VDI file size?"

[mk-ext4-sparse]: http://unix.stackexchange.com/questions/11100/how-to-make-ext4-filesystem-sparse/11248#11248
                  "How to make ext4 filesystem sparse?"
