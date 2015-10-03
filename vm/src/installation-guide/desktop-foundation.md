Desktop Foundation
==================

Follow the steps below to build a desktop foundation on the [Arch Core][install].
The aim is to keep things as simple as possible and only install what is strictly
necessary.  
After performing these steps the system will be ready to host a desktop environment.


Update System
-------------
Get latest packages,  make sure logs are clean, and system is healthy.
(See also [systemd Basic Usage][sysdBasics].)

        pacman -Syy
        pacman -Su
        grep -i err /var/log/pacman.log
        reboot
        journalctl -b
        systemctl --failed

User Management
---------------
Add user `andrea` with password: "`abc123`".  (Details in [User Management][usrManagement].)

        useradd -m -g users -s /bin/bash andrea
        passwd andrea
     
NB Adding your user to groups (`optical`, `audio`, `scanner`, etc.) is not necessary with
[systemd][sysdAndGroups].

Configure [privilege escalation][sudo]:

        pacman -S sudo
        export EDITOR=nano
        visudo  

add line at bottom of file:

        andrea ALL=(ALL) ALL


Sound
-----
Not needed as we disabled the Virtual Box sound card.  However, ALSA is included in the 
kernel and, if sound is ever required, it can be un-muted anytime, e.g. by installing
`alsa-utils`.


X Window System
---------------
Install the base [Xorg][xorg] packages:

        pacman -S xorg-server xorg-server-utils xorg-apps xorg-xinit

Note that `mesa` (3D acceleration) is bundled with `xorg-server`.

**Video Driver**.
Supplied by the Virtual Box Guest Additions, so no driver needs to be installed at this
stage.  

**Configuration**.
Arch supplies default configuration files in `/etc/X11/xorg.conf.d` and no extra
configuration is necessary for most setups.

**Keyboard**.
As for the keyboard layout, stick to the standard US keyboard as the back-tick and tilde
are conveniently located next to the `1` key.  All other keys are the same as in the UK 
keyboard, except for the key next to `z`.

**Troubleshooting**.
If a problem occurs, look for errors in `Xorg.0.log`.  Be on the lookout for any lines 
beginning with `(EE)` which represent errors, and also `(WW)` which are warnings that 
could indicate other issues.

        grep EE /var/log/Xorg.0.log



[install]: installation.html
	   "Arch Core Installation" 

[usrManagement]: https://wiki.archlinux.org/index.php/Users_and_Groups#User_management
    "User Management"

[sysdAndGroups]: https://wiki.archlinux.org/index.php/Systemd#Supplementary_information
		 "systemd: Supplementary Information"

[sysdBasics]: https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage
	      "systemd Basic Usage"

[sudo]: http://wiki.archlinux.org/index.php/Sudo
	"sudo"

[xorg]: https://wiki.archlinux.org/index.php/Xorg
	"Xorg"
