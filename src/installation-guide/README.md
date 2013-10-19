Installation Guide
==================

This guide details how to install my Arch as a guest in Virtual Box.
Follow the instructions in the below sequence:
 
  1. [Creating the Virtual Machine](create-vm.html "Creating the Virtual Machine")
  2. [Arch Core Installation](installation.html "Arch Core Installation") 
  3. [Desktop Foundation](desktop-foundation.html "Desktop Foundation")
  4. [Lightweight Desktop](lightweight-desktop.html "Lightweight Desktop")
  5. [VirtualBox Host Setup](vbox-host.html "VirtualBox Host Setup")
  6. [Customizations](customizations.html "Customizations")
  7. [Base Development Environment](base-dev-env.html "Base Development Environment") 

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
the system.

To keep the system in good shape, refer to the [Arch General Recommendations][arch-gen-rec],
especially to the System Maintenance pages listed in the [System Administration][arch-sys-adm]
section.
 



[arch-gen-rec]: https://wiki.archlinux.org/index.php/General_Recommendations
                "Arch General Recommendations"

[arch-sys-adm]: https://wiki.archlinux.org/index.php/General_Recommendations#System_administration
                "Arch System Administration"
