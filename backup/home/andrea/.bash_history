cd playground/
ls
cd audidoza/
ls -al
cabal clean
cabal build
ghc-pkg list | grep ixset-typed
ghc-pkg list | grep aeson
cabal build
ghc-pkg list | grep wai-logger
cabal build
cabal clean
cabal build
cabal clean
exit
pwd
rm -rf .cabal/ .ghc/
cabal update
rm -rf .cabal/packages/hackage.haskell.org/
cabal update
cabal install cgi --dry-run
cabal install cgi-3001 --dry-run
cabal install alex happy hscolour haddock     async attoparsec case-insensitive fgl haskell-src     hashable html HTTP HUnit mtl network parallel parsec     QuickCheck random regex-base regex-compat regex-posix split stm syb     text transformers unordered-containers vector xhtml zlib primitive --dry-run
cabal install alex happy hscolour     async attoparsec case-insensitive fgl     hashable html HTTP HUnit mtl network parallel parsec     QuickCheck random regex-base regex-compat regex-posix split stm syb     text transformers unordered-containers vector xhtml zlib primitive --dry-run
cabal install pandoc --dry-run
cabal install shake --dry-run
cabal install hackyl --dry-run
cabal install hakyll --dry-run
cabal install clay --dry-run
cabal install acid-state ixset-typed --dry-run
pwd
ls -al
rm -rf .cabal .ghc
cabal update
rm -rf .cabal/packages/hackage.haskell.org/
cabal update
cabal install cgi --dry-run
cabal install alex happy hscolour haddock         async attoparsec case-insensitive cgi fgl hashable haskell-src         html HTTP HUnit mtl network parallel parsec primitive         QuickCheck random regex-base regex-compat regex-posix split stm syb         text transformers unordered-containers vector xhtml zlib --dry-run
cabal install alex happy hscolour haddock         async attoparsec case-insensitive cgi fgl hashable haskell-src         html HTTP HUnit mtl network parallel parsec primitive         QuickCheck random regex-base regex-compat regex-posix split stm syb         text transformers unordered-containers vector xhtml zlib
cabal install alex happy hscolour haddock         async attoparsec case-insensitive fgl hashable haskell-src         html HTTP HUnit mtl network parallel parsec primitive         QuickCheck random regex-base regex-compat regex-posix split stm syb         text transformers unordered-containers vector xhtml zlib
cabal install base-unicode-symbols containers-unicode-symbols                   xml-conduit hxt hexpat hxt-expat                   heredoc                   acid-state ixset-typed                   clay --dry-run
cabal install base-unicode-symbols containers-unicode-symbols                   xml-conduit hxt hexpat hxt-expat                   heredoc                   acid-state ixset-typed                   clay 
cabal install yesod-bin --dry-run
cabal install yesod-bin
cabal install yesod-bin --dry-run
mkdir yesod && cd yesod
pwd
yesod init
ls -al
cd tmp
cabal install --enable-tests --dry-run
cabal install --enable-tests
cd ~
rm -rf yesod
ghc-pkg list | grep yesod-auth
ghc-pkg list | grep safe
ghc-pkg list | grep tmp
cabal install shake
cabal install pandoc
cabal install diagrams --dry-run
cabal install diagrams
exit
pwd
ls -al
cabal install diagrams
exit
ghc-pkg list | grep gmp
ghc --info |grep llvm
ghc --info | grep llvm
ghc --info
pacman -Ss llvm
sudo pacman -S llvm
which llvm
exit
cd playground/
ls
cd haskell-env/
ls -al
pwd
cd ..
rm -rf haskell-env/
ls -al
exit
cd projects/archlinux/vm/
ls
cd src/
ls
cd installation-guide/
ls
cd ..
ls
cd build/
ls
pwd
ls -al
cat build.sh 
runhaskell Shakefile clean
runhaskell Shakefile
ghc-pkg list | grep hak
cabal install hakyll -f-previewServer -f-watchServer -f-checkExternal
runhaskell Shakefile
pwd
exit
ls
cd playground/
ls
mkdir rachel
cd rachel/
ls
exit
pwd
cd projects/CV/
ls
rm current-cv.pdf 
cp src/main.pdf  andrea-falconi.cv.pdf 
ls -al
tree
ls -al
ls -al src/
rm src/andrea-falconi.cv.pdf 
ls -al src/auto/
rm -rf src/auto/
ls -al src/
exit
cd playground/rachel/
ls
cp field-work-report.tex field-work-report.tex.old
rm field-work-report.tex
mv field-work-report.tex.old field-work-report.tex
ls -al
exit
ls -al tmp/
mv dropbox/interstellar.torrent tmp/
cd tmp/
aria2c -u40K interstellar.torrent 
less interstellar.torrent 
rm interstellar.torrent 
exit
cd tmp/
aria2c -u40K 'magnet:?xt=urn:btih:d84c9f40b8cd79db556711430949192d1f36fc5d&dn=Interstellar.DVDRip.XviD-MAXSPEED&xl=720320811&dl=720320811'
exit
cd tmp/
aria2c -u40K 'magnet:?xt=urn:btih:ACD1595A7606A8DE0D67DB0BEF8DA55E24FC95B2&dn=Interstellar.DVDRip.XviD-MAXSPEED'
exit
pwd
ls
mkdir tmp
cd tmp/
aria2c -u40K 'magnet:?xt=urn:btih:D6BA35881A053800950B40B666C9A9C98C64D8B1&dn=interstellar+2014+hdts+2audios+x264+cpg&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80%2Fannounce&tr=udp%3A%2F%2Fopen.demonii.com%3A1337'
tree
mv \[\ www.Torrentday.com\ \]\ -\ Interstellar\ \(2014\)\ HDTS\ 2Audios\ x264-CPG/Interstellar\ \(2014\)\ HDTS\ 2Audios\ x264-CPG.mp4 ~/dropbox/interstellar.mp4
pwd
rm -rf *
ls -al
pwd
mv ~/dropbox/idraw-2.5.torrent ./
aria2c -u40K idraw-2.5.torrent 
ls -al
tree -a
cd iDraw\ 2.5/
ls
ls -al
gunzip iDraw\ 2.5.zip 
ls -al
man gunzip
unzip iDraw\ 2.5.zip 
ls -al
tree -L2 
tree -L 2 
tree -L 3
tree __MACOSX/
tree -l __MACOSX/
tree -la __MACOSX/
ls -al
tree -L 3
tree -L 4
ls
tar czf idraw.tgz iDraw.app/ __MACOSX/
ls -la
mv idraw.tgz ~/dropbox
cd ..
ls
cd ..
ls
tree -L 2 tmp
rm -rf tmp/
exit
ls -al 
pwd
clear
exit
less .xmonad/xmonad.con
less .xmonad/xmonad.hs
exit
ls -al
ls projects/
cd projects/
exit
cd projects
ls -la
ls DVT/
cd DVT/
ls -la
ls -O
ls -al _other_/
ls -la
ls
ls Truworths/
ls S1-ACI/
ls S1-ACI/Aug2010-Jun2012/
ls ~/projects/CV/
ls ~/projects/CV/src/
ls 
mkdir Woolworths
ls
exit
cd playground
ls -al
mkdir appeal
mv appeal.txt appeal/
ls ~/projects/CV/
ls ~/projects/CV/src/
ls -al
cd appeal/
ls -al
exit
ls -al
ls -al playground
ls -al playground/
ls -al playground/appeal/
less mk-backup/exclude.lst 
less mk-backup/rbackup.sh 
exit
tree -L 2
ls -al mk-backup/log 
date
tree -L 2 projects
tree -L 2 playground
exit
xrandr 
exit
