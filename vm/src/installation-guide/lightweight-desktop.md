Lightweight Desktop
===================

Follow the steps below to install a lightweight desktop with [automatic login][autoLogin]
(without using a display manager) and [Xmonad][Xmonad] as window manager.
The idea is to have a functional core desktop which avoids any dependencies on Qt, KDE,
and GNOME.

The below instructions assume you have logged in as `andrea`, not `root`.


Automatic Login
---------------
Create an ovveride file to set up automatic login on virtual console 1:

        sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
        sudo nano /etc/systemd/system/getty@tty1.service.d/override.conf

Enter the following and save:

        [Service]
        Type=simple
        ExecStart=
        ExecStart=-/sbin/agetty --autologin username --noclear %I 38400 linux
        
Now start X when loggin into `tty1`; edit `~/.bash_profile` to append:

        [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx


Xmonad
------
Install:

        sudo pacman -S xmonad xmonad-contrib

Configure to work with `startx`:

        cp /etc/X11/xinit/xinitrc ~/.xinitrc
        chmod +x ~/.xinitrc
        nano ~/.xinitrc

and add these two lines at the end of the file:

        xsetroot -cursor_name left_ptr
        exec /usr/bin/xmonad

To be able to start Xmonad, you'll need at least a bare-bones configuration.

        mkdir ~/.xmonad
        cat >  ~/.xmonad/xmonad.hs
        import XMonad
        main = do
               xmonad $ defaultConfig
	
        xmonad --recompile




[autoLogin]: https://wiki.archlinux.org/index.php/Automatic_login_to_virtual_console
    "Automatic login to virtual console"

[Xmonad]: https://wiki.archlinux.org/index.php/Xmonad
    "Xmonad"
