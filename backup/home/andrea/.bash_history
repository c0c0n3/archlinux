less /etc/shadow
sudo less /etc/shadow
ls -al
less .bashrc 
nano .bashrc 
pwd
ls -al
nano .bashrc 
poweroff
exit
ls /
ls /mnt/
ls /dev
mount
poweroff
sudo poweroff
man colordiff
which diffcolor
diff /etc/skel/.bash_profile .bash_profile 
which poweroff
less /usr/bin/poweroff 
sudo systemctl reboot
man dircolors
dircolors -b
ls -al
sudo systemctl --failed
sudo pacman -Syy
sudo pacman -S xorg-server
sudo pacman -Su
sudo pacman -S xorg-apps
sudo pacman -S xorg-xinit
sudo pacman -S xorg-xinit xorg-server xorg-apps mesa
lspci | grep VGA
sudo pacman -S mesa
sudo pacman -S xorg-xinit xorg-server xorg-apps
sudo pacman -S mesa
sudo ls -al /var/log
sudo systemdctl --failed
sudo sys
sudo systemdctl reboot
sudo systemctl reboot
sudp pacman -Syy
sudo pacman -Syy
sudo pacman -Su
journalctl -b
sudo journalctl -b
sudo systemctl --failed
whcih X
which X
sudo pacman -S slim
sudo systemctl enable slim.service
sudo pacman -S cabal-install
sudo pacman -S ghc cabal-install
cabal update
sudo pacman -S pkg-config
ls -al
cabal install xmonad xmonad-contrib
cp /etc/skel/.xinitrc ~
ls -al
chmod +x .xinitrc 
ls -al
nano .xinitrc 
ls -al
mkdir .xmonad
cat > .xmonad/xmonad.hs
less .xmonad/xmonad.hs 
.cabal/bin/xmonad --recompile
ls -al
ls -al .xmonad/
cat .xmonad/xmonad.errors 
sudo systemctl poweroff
sudo pacman -S virtualbox-guest-utils
sudo nano /etc/modules-load.d/virtualbox.conf
nano .xinitrc 
which VBoxClient-all
which VBoxClient-all >> .xinitrc 
nano .xinitrc 
cat .xinitrc 
sudo systemctl enable vboxservice.service
sudo groupadd vboxsf
sudo gpasswd -a $USER vboxsf
id
sudo nano /etc/fstab 
sudo systemctl reboot
sudo journalctl -b
ping -c 1 8.8.8.8
ps -ejH
ls /media/
ls /media/dropbox/
ls -al /media/dropbox/
pwd
ls -al
ln -s /media/dropbox dropbox
ln -s /media/projects projects
ln -s /media/playground playground
ls -al
ls playground
ls projects
ls dropbox
sudo systemctl poweroff
ls -al
mkdir aur
ls -al
sudo nano /etc/systemd/journald.conf 
ps -ejH
pkill xmonad
pacman -Q gtk
pacman -Q gtk3
pacman -Q gtk-3
pacman -Qs gtk
ps -ejH
sudo journalctl -b
sudo ls -al /var/log
sudo  grep EE /var/log/Xorg.0.log
sudo pacman -Syy
sudo pacman -Su
ls dropbox
cd dropbox/tmp/etc/systemd/
sudo diff journald.conf /etc/systemd/journald.conf 
sudo systemctl reboot
ls -al
exit
grep Colo /etc/pacman.conf 
less .bashrc 
cp dropbox/tmp/andrea/.bashrc ./
less .bashrc 
ls -al .bash
ls -al .bash*
ls -al
cp -r ~/dropbox/tmp/andrea/.emacs* ./
ls -la
chmod 0644 .emacs
chmod 0755 .emacs.d
ls -al
cd .emacs.d
ls -al
rm -rf auto-save-list/
chmod 0644 *.el
ls -al
chmod 0755 emacs-color-theme-solarized/
ls -al
cd emacs-color-theme-solarized/
ls -al
chmod 0644 *
ls -al
cd ~/.xmonad/
cp ~/dropbox/tmp/andrea/.xmonad/xmonad.hs ./
ls -al
exit
xmonad --recompile
less .xmonad/xmonad.hs
cd /etc/
sudo ls -al visudo
sudo ls -al visu*
sudo find ./ -name viso
sudo find ./ -name vis
ls 
pwd
sudo ls -al sudoers
sudo diff sudoers /home/andrea/dropbox/tmp/etc/sudoers
sudo cp /home/andrea/dropbox/tmp/etc/sudoers ./
sudo ls -al sudoers
sudo diff sudoers /home/andrea/dropbox/tmp/etc/sudoers
pwd
cd ~
ls -al
cp -r dropbox/tmp/andrea/wallpapers ./
ls -al
chmod 0755 wallpapers/
ls -al
cd wallpapers/
ls -al
chmod 0644 *
la -sl
la -al
ls -al
ln -s current vitruvian.wallpaper.png 
ln -s vitruvian.wallpaper.png current 
ls -al
cd ~
diff .xinitrc dropbox/tmp/andrea/.xinitrc 
cp dropbox/tmp/andrea/.xinitrc ./
less .xinitrc 
ls -al
sudo  grep EE /var/log/Xorg.0.log
sudo journalctl -b
cd dropbox/tmp/etc/
sudo diff pacman.conf /etc/pacman.conf 
ls -al /etc/pacman.conf 
sudo cp pacman.conf /etc/
ls -al /etc/pacman.conf 
sudo diff pacman.conf /etc/pacman.conf 
cd ..
ls -la
chmod +x run.sh 
sudo ./run.sh 
ls -al
sudo chmod +x run.sh 
ls -al
cp run.sh ~/
chmod +x ~/run.sh 
sudo ~/run.sh 
sudo ~/run.sh 
cd ~/aur/
ls
mkdir ttf-monaco
cp ~/dropbox/tmp/andrea/aur/ttf-monaco/aur.url ./
ls -la
ls -alR
mv aur.url ttf-monaco/
cd ttf-monaco/
curl -O $(cat aur.url)
ls
tar xzf ttf-monaco.tar.gz 
cd ttf-monaco
ls
makepkg -s
ls 
sudo pacman -U ttf-monaco-5.1-2-any.pkg.tar.xz 
ls -al
cd ..
ls -al
rm -rf tt*
ls -al
cd ..
ls
chmod 0644 ttf-monaco/aur.url 
ls -al ttf-monaco/
mkdir bahamas-font
ls -al
cd bahamas-font/
cp ~/dropbox/tmp/andrea/aur/bahamas-font/aur.url ./
chmod 0644 aur.url 
curl -O $(cat aur.url)
tar xzf bahamas-font.tar.gz 
cd bahamas-font
makepkg -s
sudo fc-cache -fs
cd ~
cp ~/dropbox/tmp/run.sh ./
ls -al
sudo ./run.sh 
sudo pacman gnome-themes-standard
sudo pacman -S gnome-themes-standard
sudo pacman -S gnome-icon-theme
ls -al
mkdir -p .config/gtk-3.0 
cp dropbox/tmp/andrea/.config/gtk-3.0/settings.ini .config/gtk-3.0/
ls -al .config/gtk-3.0/settings.ini 
chmod 0644 .config/gtk-3.0/settings.ini 
ls -al .config/gtk-3.0/settings.ini 
less .config/gtk-3.0/settings.ini 
cd .config/gtk-3.0/
cp ~/dropbox/tmp/run.sh settings.ini 
less settings.ini 
cd ~/aur/
ls 
ls bahamas-font/
cd bahamas-font/
rm -rf bahamas-font*
ls -al
cd ..
ls -alR ./
mkdir buuficontheme
ls -la
cd buuficontheme/
cp ~/dropbox/tmp/andrea/aur/buuficontheme/aur.url ./
less aur.url 
ls -al
chmod 0644 aur.url 
curl -O $(cat aur.url)
tar xfz buuficontheme.tar.gz 
cd buuficontheme
ls
makepkg -s
ls -al
sudo pacman -S buuficontheme-3.10-1-any.pkg.tar.xz 
sudo pacman -U buuficontheme-3.10-1-any.pkg.tar.xz 
ls -al
cd ..
ls -al
rm -rf buuficontheme*
ls -al
cd ..
ls -alR
ls -al ~/dropbox/tmp/andrea/aur/
cp ~/dropbox/tmp/andrea/aur/madematix-slim-theme-1.0-1-any.pkg.tar.xz ./
ls -la
chmod 0644 madematix-slim-theme-1.0-1-any.pkg.tar.xz 
sudo pacman -U madematix-slim-theme-1.0-1-any.pkg.tar.xz 
cd /etc/
sudo diff slim.conf /home/andrea/dropbox/tmp/etc/slim.conf 
ls -al /etc/slim.conf 
sudo cp /home/andrea/dropbox/tmp/etc/slim.conf ./ 
ls -al /etc/slim.conf 
sudo systemctl reboot
xrandr 
ls /usr/share/fonts/TTF/
pwd
cd ~/aur/bahamas-font/
ls -al
curl -O $(cat aur.url)
ls
tar xzf bahamas-font.tar.gz 
ls -al
cd bahamas-font/
ls -al
makepkg -s PKGBUILD 
ls -al
sudo pacman -U bahamas-font-1.0-1-any.pkg.tar.xz 
exit
ls -al
sudo journalctl -b
exit
ls -al
xrandr 
exit
xrandr 
exit
pwd
cd ~/.themes/
ls
rm -rf Adwaita/
cp -r /usr/share/themes/Adwaita ./
ls -al
ls Adwaita/
pwd
cd ~
rm -rf .themes/
exit
grep flet -R .emacs.d/
pacman -Qi gnome-icon-theme
exit
ls -al
ls -R aur/
ls aur/
cd aur/bahamas-font/
ls -al
rm -rf bahamas-font*
ls -al
cd ..
ls -R aur/
pwd
ls -alR
cd ..
ls -al
rm run.sh 
ls wallpapers/
ls -al wallpapers/
cat .Xauthority 
exit
ls -al
drwxr-xr-x  2 andrea users 4096 Oct 17 23:45 .xmonad
cd .xmonad/
ls -al
cd ~
ls projects/
cd projects/archlinux/
ls
cp -r projects/archlinux/mactop/_root_/home/andrea/mk-backup ./
ls -al
chmod 0755 mk-backup/
chmod 0644 mk-backup/*
ls -al mk-backup/
chmod +x mk-backup/rbackup.sh 
pwd
cd projects/archlinux/vm/backup/
pwd
cd ~/mk-backup/
ls -al
./rbackup.sh 
rm log 
./rbackup.sh 
ls -al ~
ls -al ~/.config/
ls -al ~/.local/
ls -al ~/.local/share/
ls -al ~/.local/share/systemd/
./rbackup.sh 
rm log 
./rbackup.sh 
sudo ./rbackup.sh 
rm backup.lst 
ls -al
exit
sudo ls -al /
ls /boot/
sudo ls -al /boot/syslinux/
sudo journalctl -b
sudo pacman -S rsync
man rm
pwd
ls -al
exit
cd mk-backup/
tail -f log 
exit
ls projects/archlinux/vm/
mkdir projects/archlinux/vm/backup
ls
ls mk-backup/
ls -al
cd mk-backup/
ls -al
sudo ./rbackup.sh 
exit
sudo journalctl -b
exi
mount
ls projects
ls dropbox
ls playground
ping -c 1 8.8.8.8
curl www.google.com
exit
xrandr 
sudo journalctl -b
exit
ls .emacs.d
exit
ls -al
exit
pwd
mkdir tmp
pwd
rm -rf tmp/
exit
sudo pacman -S aspell aspell-en
exit
mkdir tmp
which gv
which gsview
pacman -Qs ghost
pwd
mv tmp/xxx.pdf dropbox/
rm -rf tmp/
exit
rm dropbox/xxx.pdf 
exit
sudo pacman -S texlive-most
sudo pacman -S auctex
sudo pacman -Syy
sudo pacman -Su
pwd
cabal update
sudo pacman -S emacs-haskell-mode
cd  /usr/share/emacs/site-lisp/haskell-mode
ls -al
ls
ls | grep site
pwd
cabal --help
cabal --version
cabal install haskell-platform --dry-run
ghc --version
cabal install alex happy --dry-run -v
cabal install alex happy
which happy
which haddoc
whichalex
which alex
which haddock
cabal list --installed
exit
cabal list --installed | grep alex
which alex
cabal install             async attoparsec case-insensitive cgi fgl GLUT GLURaw haskell-src             hashable html HTTP HUnit mtl network OpenGL OpenGLRaw parallel parsec             QuickCheck random regex-base regex-compat regex-posix split stm syb             text transformers unordered-containers vector xhtml zlib primitive
sudo pacman -S git
cabal install darcs
which darcs
which eject
pacman -S aria2 hwinfo hwdetect hdparm sdparm smartmontools ntfs-3g        ethtool tcpdump dnsutils nmap tree bc fastjar unzip unrar cdrkit
sudo pacman -S aria2 hwinfo hwdetect hdparm sdparm smartmontools ntfs-3g 
sudo pacman -S aria2 hwinfo hwdetect hdparm sdparm smartmontools ntfs-3g        ethtool tcpdump dnsutils nmap tree bc fastjar unzip unrar cdrkit
exit
tree -L 2
tree -Lp 2
rm -rf tmo/
ls -al
sudo du -h /*
sudo du -h /
sudo du -hs /*
sudo du -hs /home/andrea/*
sudo du -hs /home/andrea
sudo du -hs /home/andrea/.cabal/
sudo du -hs /home/andrea/.ghc/
sudo du -hs /usr/local/
sudo du -hs /var/
sudo du -hs /var/*
sudo du -hs /var/cache/
sudo du -hs /var/cache/*
sudo ls -al /var/cache/pacman/ 
sudo ls -al /var/cache/pacman/pkg/
pacman -Qdt
sudo find / -name '.pac*'
sudo find / -name 'pacm*'
exitsudo find / -name '.pac*'
exit
man pacman
exit
