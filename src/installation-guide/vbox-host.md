VirtualBox Host Setup
=====================

Now Arch needs to be set up to work with VirtualBox.  Details on the [Arch wiki][vboxGuest].
The below instructions assume you have logged in as `andrea`, not `root`.


Installation & Configuration
----------------------------
Install guest additions:

        sudo pacman -S virtualbox-guest-utils

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

        sudo systemctl enable vboxservice.service


Shared Folders
--------------
Add your username to the `vboxsf` group and use `newgrp` to apply the changes immediately:

        sudo gpasswd -a $USER vboxsf
        newgrp

Monted folders will be in `/media`, but browse permissions have to be assigned; also the
mount points (directories) have to be created:

        sudo mkdir -p /media
        sudo chmod 755 /media        # only needed if /media already existed
        sudo mkdir /media/dropbox
        sudo mkdir /media/github
        sudo mkdir /media/playground
        sudo mkdir /media/projects

Figure out your `uid`, `guid`, and `umask` by running `id` and `umask`; then replace
`1000`, `100`, and `0022` with the actual values in the below lines which need to be
added to `/etc/fstab`:

        dropbox   /media/dropbox    vboxsf  uid=1000,gid=100,umask=0022,rw,comment=systemd.automount 0 0
        github   /media/github    vboxsf  uid=1000,gid=100,umask=0022,rw,comment=systemd.automount 0 0
        playground   /media/playground    vboxsf  uid=1000,gid=100,umask=0022,rw,comment=systemd.automount 0 0
        projects   /media/projects    vboxsf  uid=1000,gid=100,umask=0022,rw,comment=systemd.automount 0 0
		
Symlink them in your home:

        ln -s /media/dropbox ~/dropbox
        ln -s /media/github ~/github
        ln -s /media/playground ~/playground
        ln -s /media/projects ~/projects	


Notes
-----
1. Auto-mounted shared folders.  Files in automounted folders will be own by `root` and
have a group of `vboxsf`.  On creating a new file in Arch, permissions will be set to
`rwx` (i.e. exec!) for both user and group; however, they will be `rw` in the OS X host.
Manual mounting, as done above, makes ownership `andrea / users` and ensures permissions
are set correctly in the guest and reflected too in the host.
More details [here][vobxShare].


Known Issues
------------
1. VBox video driver.  You can find the following errors in `/var/log/Xorg.0.log`:

        (EE) Failed to load module "vesa" (module does not exist, 0)
        (EE) Failed to load module "fbdev" (module does not exist, 0)
        (EE) AIGLX: reverting to software rendering

    However, it seems that the system still works decently, so I didn't find out more...


[vboxGuest]: https://wiki.archlinux.org/index.php/VirtualBox#Arch_Linux_as_a_guest_in_a_Virtual_Machine
    "Arch as a Guest in VirtualBox"
[vobxShare]: http://askubuntu.com/questions/123025/what-is-the-correct-way-to-share-directories-in-mac-and-ubuntu-with-correct-perm
    "What is the correct way to share directories in Mac and Ubuntu with correct permissions?"
