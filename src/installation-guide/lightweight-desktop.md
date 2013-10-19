Lightweight Desktop
===================

Follow the steps below to install a lightweight desktop with [SLiM][SLiM] as display
manager and [Xmonad][Xmonad] as window manager.
The idea is to have a functional core desktop which avoids any dependencies on Qt, KDE,
and GNOME.

The below instructions assume you have logged in as `andrea`, not `root`.

SLiM
----
Install:

        sudo pacman -S slim

Enable:
	
        sudo systemctl enable slim.service


Haskell
-------
We're going to install GHC and Cabal so that all other Haskell packages (including Xmonad)
can be installed in the home directory.  This way, if dependency issues arise, we can easily
just delete the `.ghc` and `.cabal` directories and re-install from a clean environment.

        sudo pacman -S ghc cabal-install
        cabal update

Xmonad
------
Install:

        sudo pacman -S pkg-config
        cabal install xmonad xmonad-contrib

NB: The above puts executable and Haskell libraries in `~/.cabal`.  Haskell packages are
registered locally too in `~/.ghc`.

Configure to work with SLiM:

        cp /etc/skel/.xinitrc ~
        chmod +x ~/.xinitrc	   
        nano ~/.xinitrc

and add these two lines at the end of the file:

    	xsetroot -cursor_name left_ptr
        exec /home/andrea/.cabal/bin/xmonad

To be able to start Xmonad, you'll need at least a bare-bones configuration.

        mkdir ~/.xmonad
        cat >  ~/.xmonad/xmonad.hs
        import XMonad
        main = do
               xmonad $ defaultConfig
	
        ~/.cabal/bin/xmonad --recompile




[SLiM]: https://wiki.archlinux.org/index.php/SLiM
	"SLiM"

[Xmonad]: https://wiki.archlinux.org/index.php/Xmonad
	  "Xmonad"