#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# moved from down below to ensure wallpaper shows...
feh --bg-scale /home/andrea/wallpapers/current &

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# above was copied over from /etc/skel/.xinitrc
# except for feh command, see below.
# below are the commands to bring up the XMonad environment in VBox.

/usr/bin/VBoxClient-all &

/usr/bin/xsetroot -cursor_name left_ptr
/usr/bin/xcompmgr -c &
# moved setting of wallpaper to top as sometimes it doesn't show. 
#feh --bg-scale /home/andrea/wallpapers/current &

exec /usr/bin/xmonad
