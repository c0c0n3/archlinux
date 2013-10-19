VirtualBox Host Setup
=====================

Now Arch needs to be set up to work with VirtualBox.  Details on the [Arch wiki][vboxGuest].


Installation & Configuration
----------------------------
Install guest additions:

        pacman -S  virtualbox-guest-utils

Create `/etc/modules-load.d/virtualbox.conf` to contain the following lines so to load the
VirtualBox modules:

        vboxguest
        vboxsf
        vboxvideo

Launch `VBoxClient-all` before the Window Manager to start services for sharing the 
clipboard, resizing the screen, etc.  Add the following line to `~/.xinitrc` just
before launching Xmonad:

        /usr/bin/VBoxClient-all &

Enable `vboxservice` so to synchronise guest date with host and share folders:

        systemctl enable vboxservice.service


Shared Folders
--------------
Add your username to the `vboxsf` group:

        groupadd vboxsf
        gpasswd -a $USER vboxsf

Figure out your `uid` and `guid` by running `id`; then replace 1000 and 100 with the
actual values in the below lines which need to be added to `/etc/fstab`:

        dropbox   /media/dropbox    vboxsf  uid=1000,gid=100,rw,dmode=700,fmode=600,comment=systemd.automount 0 0
        playground   /media/playground    vboxsf  uid=1000,gid=100,rw,dmode=700,fmode=600,comment=systemd.automount 0 0
        projects   /media/projects    vboxsf  uid=1000,gid=100,rw,dmode=700,fmode=600,comment=systemd.automount 0 0

Symlink them in your home:

        ln -s /media/dropbox ~/dropbox
        ln -s /media/playground ~/playground
        ln -s /media/projects ~/projects	

NB don't automount in the VBox GUI as user/group won't be reflected correctly in Arch.


Known Issues
------------
1. VBox video driver.  You can find the following errors in `/var/log/Xorg.0.log`:

        (EE) Failed to load module "vesa" (module does not exist, 0)
        (EE) Failed to load module "modesetting" (module does not exist, 0)
        (EE) Failed to load module "fbdev" (module does not exist, 0)
        (EE) AIGLX error: vboxvideo does not export required DRI extension
        (EE) AIGLX: reverting to software rendering

However, it seems that the system still works decently, so I didn't find out more...


[vboxGuest]: https://wiki.archlinux.org/index.php/VirtualBox#Arch_Linux_as_a_guest_in_a_Virtual_Machine
	     "Arch as a Guest in VirtualBox"
