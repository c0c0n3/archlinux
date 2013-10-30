{-# LANGUAGE UnicodeSyntax #-}
module Paths where

import Prelude.Unicode

import Development.Shake.FilePath


-- NB for simplicity we assume the build is always run from the build/ dir.
-- This holds true because the build is run by invoking build.sh, which cd
-- in the build/ dir before running Shakefile.hs.
baseDir  = "../../"
srcDir   = baseDir </> "src"
buildDir = "."
binDir   = baseDir </> "bin"


-- NB /tmp has tmpfs, so it's contents will go when the system halts/reboots.
baseTmpDir   = "/tmp/archlinux-vm"
hakyllTmpDir = baseTmpDir </> "hakyll"
shakeTmpDir  = baseTmpDir </> "shake/"

siteBuilder  = baseTmpDir </> "site"
