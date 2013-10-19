Customizations
==============
Going to make the lightweight desktop more functional and add some eye-candy.
The below instructions assume you have logged in as `andrea`, not `root`.
Before starting, update the system, check logs are clean, and make sure there
are no orphaned packages.

Backups
-------
Install [rsync][rsync] and copy backup scripts:

        sudo pacman -S rsync
        ~/mk-backup


AUR
---
Create the directory in which to download and build packages not in the official repos.
To build Arch packages locally, you also need `fakeroot`; also, because some packages
come bundled in zip files, `unzip` is needed.

        mkdir ~/aur
        sudo pacman -S fakeroot unzip

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
Install Infinality from bohoomil's repository.  (Details on [Arch wiki][infin].)

Add repository to `/etc/pacman.conf`:

        [infinality-bundle]
        Server = http://ibn.net63.net/infinality-bundle/$arch

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
        ~/.cabal/bin/xmonad --recompile
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

#### SLiM Theme
Install custom theme by following instructions in `projects/archlinux/aur/madematix-slim-theme/README`.

#### GTK 3 Theme
  * Install Buuf icon theme from the AUR.
  * `sudo pacman gnome-themes-standard gnome-icon-theme`
  * `~/.config/gtk-3.0/settings.ini`:

            [Settings] 
            gtk-theme-name = Adwaita
            gtk-application-prefer-dark-theme = false
            gtk-cursor-theme-name=Adwaita
            gtk-fallback-icon-theme = gnome
            gtk-icon-theme-name = buuficontheme
            gtk-font-name = Bahamas 12

#### Wallpaper
  * `~/wallpapers`
  * `cd ~/wallpapers`
  * `ln -s your-wallpaper.jpg current`
  * install [feh][feh] image viewer: `sudo pacman -S feh`
  * add to `~/.xinitrc`: `feh --bg-scale /home/andrea/wallpapers/current`



Known Issues
------------
1.**Emacs core dump**.  Emacs (compiled with GTK) crashes if it looses the connection to
X.  To avoid core dump files polluting your machine make sure
  
  * **all Emacs** windows are **closed before shutting down or rebooting**;
  * in particular: **Never shutdown/reboot from the Emacs shell**.

2.**Emacs Solarized Theme**.  It uses an obsolete macro (in `solarized-definitions.el`)
which results in the following warning being output to the Emacs Messages buffer:

        `flet' is an obsolete macro (as of 24.3); use either `cl-flet' or `cl-letf'.

3.**malys-inversio theme**.  Currently broken; see `README` in 
`projects/archlinux/aur/malys-inversio.gtk3-theme/`.  However, above GTK theme gets close. 


Notes
-----
1.**Backups**.  The idea is to keep all work in `data/{projects, playground}` (on the 
Mac and symlinked in the VM) which are backed up to Dropbox.  Also note:

  * `data/VMs/dropbox` is only meant to be used as a quick way to exchange/download files; 
     never store anything you care about in there as it's not backed up to Dropbox;
  * the VM itself is not backed up to Dropbox either.

So the VM will only contain configuration files and scripts; these will change overtime
and should be backed up regularly using the backup script, which backs up `/boot`, `/etc`,
and `/home` (symlinks excluded) to `data/projects/archlinux/vm/backup`.  This directory
is in the git repository so we can also track changes (remember to commit after backing
up).

2.**Fonts**.  I used to install these too: `ttf-ms-fonts`, `ttf-isabella`; 
but now I don't think I need them anymore.

3.**XMonad Keys**.  To avoid interference with Emacs, the XMonad `Mod` key is mapped to
the left `Cmd` key instead of `Alt`.  Because VirtualBox uses that as default host key,
you need to remap it to the right `Cmd` key:

        VirtualBox -> Preferences -> Input -> Host Key = right Cmd

Also to avoid interference, "`Mod+<Shift> q`" (quit XMonad) is remapped to 
"`Mod+<Backspace> q`"; this is because "`Mod = left Cmd`", but "`<left Cmd>+<Shift> q`" brings
up Mac OSX logout dialog.  Here's a quick reference to the key bindings that were added:
   
        <left Cmd>+<Shift> <Return>  : terminal (Emacs ansi-term shell).
        <left Cmd>+x e               : editor (Emacs).
        <left Cmd>+a                 : Grid Select.
        <left Cmd>+<Backspace> q     : quit Xmonad.
        <left Cmd>+<Backspace> s     : shutdown.
        <left Cmd>+<Backspace> r     : reboot.

For more info on key mapping see the Arch [wiki][extraKeys] and the documentation of the
`XMonad.Util.EZConfig` module.

4.**X Resources**.  Not currently using X resources and modmap, so there's no need to
have code in `~/.xinitrc` to merge them in.  (Have no `.Xresources` and `.Xmodmap` in 
`~` and `/etc`.)  If ever needed, you can use [this code][xres] taken from 
`/etc/X11/xinit/xinitrc` and add it at the beginning of `~/.xinitrc`.
For more info, see the Arch wiki pages on [xinitrc][xinitrc] and [X resources][xres].

5.**Screen-saver**.  Kinda pointless as Mac OSX screen-saver will kick-in.  To see how to
set it up, refer to the `sys-install-n-conf/instructions/` of the old `mactop`.
(BTW, OSX screen-saver is using the same images as the old `mactop`: 
`look-n-feel/cosmos-screensaver`.)

6.**Emacs Config**.  Made it modular; some of the modules (`spell.el`, `latex.el`, and
`haskell.el`) are not loaded as they require functionality which will only be available
later when we set up the development environment.  
Also, the [Solarized][sloar] [theme][emacs-solar] might need to be re-downloaded into
`~/.emacs.d/emacs-color-theme-solarized` if it becomes incompatible with new versions
of Emacs.

7.**Pacman Performance**.  Pacman usually performs decently out of the box; however
performance can be improved (e.g. parallel downloads) as explained on the Arch
[wiki][pac-perf].

8.**Root Account**.  Optionally, you could copy the contents of `~/.emacs*` into `/root/`; 
then customise for `root`.  Similarly, some of the settings in `~/.bashrc` could be added
to `/root/.bashrc`.  (**NB** do **not blindly override** `/root/.bashrc` with `~/.bashrc`
as you need to keep some of the settings in the former!)  

9.**malys-inversio**.  My modified version of the theme; if it becomes available in the AUR, 
then ditch my own package?  It brings in `gtk-engine-unico` as a dependency.

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

[rsync]: https://wiki.archlinux.org/index.php/Rsync
	 "Rsync"
