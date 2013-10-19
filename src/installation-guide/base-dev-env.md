Base Development Environment
============================
Going to install the core development environment.  Again, you're logged in as `andrea`,
not `root`.  Do a system upgrade and refresh Cabal index first:

        sudo pacman -Syy
        sudo pacman -Su
        cabal update

Note that Haskell packages will all be installed locally (`~/.cabal`, `~/.ghc`).


Haskell
-------
  * Install [Emacs Haskell mode][hask-mode]: `pacman -S emacs-haskell-mode`
  * Install (latest) packages included in the Haskell Platform:

        cabal install alex happy 
        cabal install \
            async attoparsec case-insensitive cgi fgl GLUT GLURaw haskell-src \
            hashable html HTTP HUnit mtl network OpenGL OpenGLRaw parallel parsec \
            QuickCheck random regex-base regex-compat regex-posix split stm syb \
            text transformers unordered-containers vector xhtml zlib primitive


Version Control
---------------
        pacman -S git
        cabal install darcs


Writing
-------
  * [LaTeX][tex]: `pacman -S texlive-most`
  * [AucTeX][auctex]: `pacman -S auctex`
  * [RefTeX][reftex]: comes with Emacs (enabled in `~/.emacs.d/latex.el`)
  * Spell checking: `pacman -S aspell aspell-en`


Useful Tools
------------
  * Internet: `pacman -S aria2`
  * Hardware: `pacman -S hwinfo hwdetect`
  * Disk: `pacman -S hdparm sdparm smartmontools`
  * Filesystems: `pacman -S ntfs-3g`
  * Network: `pacman -S ethtool tcpdump dnsutils nmap`
  * Commands: `pacman -S tree bc` 
  * Compression: `pacman -S fastjar unzip unrar cdrkit`
    (they all work with `lesspipe`) 


Configuration
-------------
  * Load following modules in `~/.emacs`: latex, spell, haskell.




[hask-mode]: http://www.haskell.org/haskellwiki/Emacs
             "Haskell with Emacs"

[tex]: https://wiki.archlinux.org/index.php/TeX_Live
       "LaTeX"

[auctex]: http://www.gnu.org/software/auctex/index.html
	  "AucTeX"

[reftex]: http://www.gnu.org/software/auctex/reftex.html
	  "RefTeX"
