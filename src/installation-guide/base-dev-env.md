Base Development Environment
============================
Going to install the core development environment.  Again, you're logged in as `andrea`,
not `root`.  Do a system upgrade first:

        sudo pacman -Syy
        sudo pacman -Su


Haskell
-------
  * Install [Emacs Haskell mode][hask-mode]: `pacman -S emacs-haskell-mode`

  * Install bare bones Haskell environment as documented on [Stackage][stackage-install-hask]:

        pacman -S cabal-install ghc happy alex haddock

  * Build Cabal index and configuration: `cabal update`

  * Add the contents of the **global** config file linked from Stackage Nightly to
    `~/.cabal/config`.

  * Install packages included in the Haskell Platform:

        sudo sudo pacman -S glu freeglut
                          # required to compile GLURaw and GLUT on which OpenGL depends
        cabal install \
            async attoparsec case-insensitive cgi fgl GLUT GLURaw haskell-src \
            hashable html HTTP HUnit mtl network OpenGL OpenGLRaw parallel parsec \
            QuickCheck random regex-base regex-compat regex-posix split stm syb \
            text transformers unordered-containers vector xhtml zlib primitive

  * [Unicode symbols][hask-unicode]: `cabal install base-unicode-symbols containers-unicode-symbols`

  * Shake build system: `cabal install shake`

  * Pandoc document converter: `cabal install pandoc`

  * Hakyll static website compiler:

            cabal install hakyll -f-previewServer -f-watchServer -f-checkExternal

    Note the flags set to false so to avoid installing Snap and all other deps; 
    this is because I don't need a preview/watch server.

  * XML libraries: `cabal install xml-conduit hxt hexpat hxt-expat`

  * Here docs: `cabal install heredoc`

  * Persistence: `cabal install acid-state`

  * Web Apps: not installing globally; rather make Yesod sandbox...

  * Testing: `cabal install SmallCheck HUnit hspec tasty`

Version Control
---------------
        pacman -S git
        cabal install darcs


Writing
-------
  * [LaTeX][tex]: `pacman -S texlive-most`
  * [AucTeX][auctex]: `pacman -S auctex`
  * [RefTeX][reftex]: comes with Emacs (enabled in `~/.emacs.d/latex.el`)
  * [Emacs Markdown Mode][md-mode]: (AUR) emacs-markdown-mode-git
  * Spell checking: `pacman -S aspell aspell-en`


Useful Tools
------------
  * Internet: `pacman -S aria2`
  * Hardware: `pacman -S hwinfo hwdetect`
  * Disk: `pacman -S hdparm sdparm smartmontools`
  * Filesystems: `pacman -S ntfs-3g`
  * Network: `pacman -S ethtool tcpdump dnsutils nmap`
  * Commands: `pacman -S tree bc lsof`
  * Compression: `pacman -S fastjar unzip unrar cdrkit`
    (they all work with `lesspipe`) 


Configuration
-------------
  * Load following modules in `~/.emacs`: latex, spell, haskell, md.




Notes
-----
1.**Haskell**. We use [Stackage][stackage] to get a stable enviromnent. Because we have
the latest GHC, we use the nightly snapshot (as opposed to LTS).
The default configuration of the Stackage Cabal file doesn't specify a remote repo from
where to download, so packages will be fetched from Hackage. However, package versions
are pinned down for all packages that were built on Stackage as part of the snapshot.
This option used to be called "inclusive" (see [FAQ][stackage-faq]); the idea is to get
most of the benefits of Stackage while still being able to install packages that are not
part of the snapshot.
When using Cabal, by default Haskell packages will be installed locally (`~/.cabal` for
libs and execs; `~/.ghc` for package DB). This way, if dependency issues arise, we can
easily just delete the `.ghc` and `.cabal` directories and re-install from a clean slate.




[hask-mode]: http://www.haskell.org/haskellwiki/Emacs
             "Haskell with Emacs"

[tex]: https://wiki.archlinux.org/index.php/TeX_Live
       "LaTeX"

[auctex]: http://www.gnu.org/software/auctex/index.html
	  "AucTeX"

[reftex]: http://www.gnu.org/software/auctex/reftex.html
	  "RefTeX"

[md-mode]: http://jblevins.org/projects/markdown-mode/
           "Emacs Markdown Mode"

[stackage]: https://www.stackage.org/
    "Stackage Server"

[stackage-install-hask]: https://www.stackage.org/install
    "Stackage: Install Haskell"

[stackage-faq]: https://github.com/fpco/stackage/wiki/Stackage-Server-FAQ
    "Stackage Server FAQ"

[hask-unicode]: http://www.haskell.org/haskellwiki/Unicode-symbols
                "Unicode Symbols in Haskell"
