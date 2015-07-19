Customizations
==============
Going to make the lightweight desktop more functional and add some eye-candy.
The below instructions assume you have logged in as `andrea`, not `root`.
Before starting, update the system, check logs are clean, and make sure there
are no orphaned packages.


AUR
---
Some packages we want to install are in the AUR; so we need to set up an environment
to build packages locally.
Create the directory in which to download and build packages not in the official repos.
To build Arch packages locally, you need the tools in `base-devel` (which contains the
basic C tool chain and a few Arch tools); also, because some packages come bundled in
zip files, `unzip` is needed.

        mkdir ~/aur
        sudo pacman -S base-devel unzip

Procedure to build & install (see [Arch wiki][aur]):

  1. acquire package: `curl -O $(cat aur.url)` 
  2. extract contents
  3. `cd` into extracted dir
  4. read `src/README`
  5. `makepkg -s`
  6. `sudo pacman -U pkg.tar.xz`


Journal Size
------------
By default it will be 10% of the partition it's on; limit it to 500M:

        sudo nano /etc/systemd/journald.conf
        SystemMaxUse=500M


Fonts
-----
Install Infinality from bohoomil's repository.  (Details on [Arch wiki 1][infin], [Arch wiki 2][bohoomil].)

Add repository to `/etc/pacman.conf`:

        [infinality-bundle]
        Server = http://bohoomil.com/repo/$arch

Import and sign the key:

        sudo pacman-key -r 962DDE58
        sudo pacman-key --lsign-key 962DDE58

Refresh repositories:

        sudo pacman -Syu

Install:

        sudo pacman -S infinality-bundle

Add some fonts:

        sudo pacman -S ttf-gentium ttf-bitstream-vera ttf-dejavu
        (AUR) ttf-monaco bahamas-font

Update font cache:

        sudo fc-cache -fs


Command Line
------------
Install advanced Bash completion:

        sudo pacman -S bash-completion

Add support for paging compressed files: 

        sudo pacman -S lesspipe

Colourise and set environment:

  * `~/.bashrc` 
  * `/etc/pacman.conf`: uncomment line "#Color"

For more details, see [Bash][bash], [core utilities][coreUtil], and 
[colour Bash prompt][colorBash]. 


Emacs
-----
Install & configure [Emacs][emacs]:
   
  * `sudo pacman -S emacs`
  * `~/.emacs*`
  * note: `.bashrc` above exports `EDITOR=emacs`


XMonad
------
Install basic support for [composite][xcompmgr] windows:

        sudo pacman -S xcompmgr

Configure:

        ~/.xmonad/xmonad.hs
        xmonad --recompile
        ~/.xinitrc	
    
Allow `andrea` to shutdown/reboot without prompting for password (needed because those
commands are bound to XMonad keys):

        su root
        export EDITOR=nano
        visudo

add line at bottom of file:
  
        andrea ALL= NOPASSWD: /usr/bin/systemctl poweroff, /usr/bin/systemctl reboot


GUI Look & Feel
---------------

#### GTK 3 Theme
  * `sudo pacman -S gnome-themes-standard gnome-icon-theme`
  * (AUR) numix-icon-theme-git (NB: will install `git` to fetch from repo)
  * `~/.config/gtk-3.0/settings.ini`:

            [Settings] 
            gtk-theme-name = Adwaita
            gtk-application-prefer-dark-theme = true
            gtk-cursor-theme-name = Adwaita
            gtk-icon-theme-name = Numix
            gtk-fallback-icon-theme = Adwaita
            gtk-font-name = Bahamas 12

#### Wallpaper
  * `~/wallpapers`
  * `cd ~/wallpapers`
  * `ln -s your-wallpaper.jpg current`
  * install [feh][feh] image viewer: `sudo pacman -S feh`
  * add to `~/.xinitrc`: `feh --bg-scale /home/andrea/wallpapers/current`



Known Issues
------------
1.**VBox video driver**.  You can sometimes see this error in in `/var/log/Xorg.0.log`:

        (EE) VBoxVideo(0): We do not own the active VT, exiting.

  Usually when this happens the wallpaper is not displayed (at this point the log is
  still clear); if you log into another `tty` and then switch back to the desktop then
  the wallpaper appears as does the error in the log.  (Note: the error message may
  come from the file `vboxvideo.c` in the `vboxvideo` source; ask Google.)
  However, it seems that the system still works decently, so I didn't find out more... 

2.**Infinality key**. Did not manage to import it as described in the procedure above.
It seems there's a bug in `pacman-key` and `dirmngr`.  (See [here][pacKeyIssue1] and
[here][pacKeyIssue2]; tried what suggested in the posts but didn't work.)
In the end, I resorted to [disabling signature checking][pacKey] for the Infinality repo
in `pacman.config`:

        [infinality-bundle]
        SigLevel = Never
        Server = http://bohoomil.com/repo/$arch

3.**Wallpaper**. Executing `feh` just before `xmonad` results (most of the times but not
always) in the wallpaper not showing until an application is launched from within Xmonad.
Executing `feh` as the very first statement in `.xinitrc` seems to work though. 


Notes
-----
1.**Fonts**.  I used to install these too: `ttf-ms-fonts`, `ttf-isabella`; 
but now I don't think I need them anymore.

2.**XMonad Keys**.  To avoid interference with Emacs, the XMonad `Mod` key is mapped to
the left `Cmd` key instead of `Alt`.  Because VirtualBox uses that as default host key,
you need to remap it to the right `Cmd` key:

        VirtualBox -> Preferences -> Input -> Host Key = right Cmd

Also to avoid interference, "`Mod+<Shift> q`" (quit XMonad) is remapped to 
"`Mod+<Backspace> q`"; this is because "`Mod = left Cmd`", but "`<left Cmd>+<Shift> q`" brings
up Mac OSX logout dialog.  Here's a quick reference to the key bindings that were added:
   
        <left Cmd>+<Shift> <Return>  : terminal (Emacs ansi-term shell).
        <left Cmd>+x e               : editor (Emacs).
        <left Cmd>+<Tab>             : Grid Select with running apps.
        <left Cmd>+<Backspace> q     : quit Xmonad.
        <left Cmd>+<Backspace> s     : shutdown.
        <left Cmd>+<Backspace> r     : reboot.

For more info on key mapping see the Arch [wiki][extraKeys] and the documentation of the
`XMonad.Util.EZConfig` module.

3.**X Resources**.  Not currently using X resources and modmap, so there's no need to
have code in `~/.xinitrc` to merge them in.  (Have no `.Xresources` and `.Xmodmap` in 
`~` and `/etc`.)  If ever needed, you can use [this code][xres] taken from 
`/etc/X11/xinit/xinitrc` and add it at the beginning of `~/.xinitrc`.
For more info, see the Arch wiki pages on [xinitrc][xinitrc] and [X resources][xres].

4.**Screen-saver**.  Kinda pointless as Mac OSX screen-saver will kick-in.  To see how to
set it up, refer to the `sys-install-n-conf/instructions/` of the old `mactop`.
(BTW, OSX screen-saver is using the same images as the old `mactop`: 
`look-n-feel/cosmos-screensaver`.)

5.**Emacs Config**.  Made it modular; some of the modules (`spell.el`, `latex.el`, and
`haskell.el`) are not loaded as they require functionality which will only be available
later when we set up the development environment.  
Also, the [Solarized][sloar] [theme][emacs-solar] might need to be re-downloaded into
`~/.emacs.d/emacs-color-theme-solarized` if it becomes incompatible with new versions
of Emacs.

6.**Emacs core dump**.  Emacs (compiled with GTK) used to crash if it lost the connection
to X.  **This doesn't happen anymore**.  (Perhaps due to the fact we don't have a login
manager?)  Should the issue resurface, to avoid core dump files polluting your machine
make sure
  
  * **all Emacs** windows are **closed before shutting down or rebooting**;
  * in particular: **Never shutdown/reboot from the Emacs shell**.

7.**Pacman Performance**.  Pacman usually performs decently out of the box; however
performance can be improved (e.g. parallel downloads) as explained on the Arch
[wiki][pac-perf].

8.**Root Account**.  Optionally, you could copy the contents of `~/.emacs*` into `/root/`; 
then customise for `root`.  Similarly, some of the settings in `~/.bashrc` could be added
to `/root/.bashrc`.  (**NB** do **not blindly override** `/root/.bashrc` with `~/.bashrc`
as you need to keep some of the settings in the former!)  

9.**GTK theme**.  Adwaita comes in dark and light versions; to switch to the light version
use: `gtk-application-prefer-dark-theme = true`.  The icons come from the [Numix][Numix]
project; if updates with new icons become available, you may want to re-install from the
AUR. Also in AUR, [Numix Circle][aur-numix-circle] is a very nice companion to Numix as it
complements it with (hundreds!) rounded icons for apps; install it if you're going to use
programs that make use of app icons, e.g. GNOME shell.

10.**[Feh][feh]**.  Lightweight and powerful image viewer; can be used from the command line
and also to manage the desktop wallpaper.

11.**[Conky][conky]**.  Optional install; if wanted:

        pacman -S conky
        cp ~/projects/archlinux/mactop/_root_/home/andrea/sys-install-n-conf/look-n-feel/conky/conkyrc.xmonad ~/.conkyrc

then add it to `~/.xinitrc` (command: `conky`) just before launching XMondad.  Here's a 
[screenshot][conky-on-l] of how it looked on the `lambda-radiance-1.jpg` background.




[aur]: https://wiki.archlinux.org/index.php/Arch_User_Repository
       "Arch User Repository"

[emacs]: https://wiki.archlinux.org/index.php/Emacs
	 "Emacs"

[sloar]: http://ethanschoonover.com/solarized
	 "Solarized"

[emacs-solar]: https://github.com/sellout/emacs-color-theme-solarized

[infin]:https://wiki.archlinux.org/index.php/Font_Configuration#Install_from_custom_repository
[bohoomil]:https://wiki.archlinux.org/index.php/Infinality-bundle%2Bfonts

[bash]: http://wiki.archlinux.org/index.php/Bash,
	"Bash"

[coreUtil]: http://wiki.archlinux.org/index.php/Core_Utilities,
	    "Core Utilities"

[colorBash]: http://wiki.archlinux.org/index.php/Color_Bash_Prompt)
	     "Color Bash Prompt" 

[xcompmgr]: https://wiki.archlinux.org/index.php/xcompmgr
	    "Xcompmgr Composite Manager"

[extraKeys]: https://wiki.archlinux.org/index.php/Extra_Keyboard_Keys
	     "Extra Keyboard Keys"

[xinitrc]: https://wiki.archlinux.org/index.php/xinitrc
	   "xinitrc"

[xres]: https://wiki.archlinux.org/index.php/x_resources
	"X Resources"

[pac-perf]: https://wiki.archlinux.org/index.php/Improve_Pacman_Performance
	    "Improve Pacman Performance"

[feh]: https://wiki.archlinux.org/index.php/Feh
    "Feh Image Viewer"

[conky]: https://wiki.archlinux.org/index.php/Conky
	 "Conky System Monitor"

[conky-on-l]: conky-on-lambda-radiance.png
	      "Conky on Lambda Radiance"

[xres]: xresources.sh
	"Merge X Resources Code Snippet"

[pacKey]: https://wiki.archlinux.org/index.php/Pacman-key
    "Pacman-key"

[pacKeyIssue1]: https://bbs.archlinux.org/viewtopic.php?id=138498
    "Pacman won't look up gpg keys"

[pacKeyIssue2]: https://bbs.archlinux.org/viewtopic.php?id=190380
    "{pacman-key} keyserver refresh failed: No dirmngr"

[Numix]: https://numixproject.org/
    "Numix Project"

[aur-numix-circle]: https://aur.archlinux.org/packages/numix-circle-icon-theme-git/
    "AUR: Numix Circle icon theme from git repo"
