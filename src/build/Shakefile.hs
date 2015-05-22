{-# LANGUAGE UnicodeSyntax #-}

import Prelude.Unicode

import Data.List

import Development.Shake 
import Development.Shake.FilePath

import Paths


opts = shakeOptions { shakeFiles = shakeTmpDir </> "" } --, shakeVerbosity = Diagnostic } 


main ∷ IO ()
main = shakeArgs opts $ do 
     
     want ["installation-guide"]
     
     "installation-guide" ~> (need [binDir, hakyllTmpDir, shakeTmpDir, siteBuilder]
                             >> buildSite)

     binDir       %> mkdir
     hakyllTmpDir %> mkdir
     shakeTmpDir  %> mkdir

     siteBuilder %> compileSiteBuilder

     "clean" ~> deleteOutput


compileSiteBuilder ∷ FilePath → Action ()
compileSiteBuilder _ = cmd "ghc --make" 
                       [ buildDir </> "Site.hs"
                       , "-o", siteBuilder
                       , "-outputdir", baseTmpDir
                       ]

buildSite ∷ Action ()
buildSite = cmd siteBuilder ["build"]

mkdir ∷ FilePath → Action ()
mkdir d = cmd "mkdir -p" [d]

deleteOutput ∷ Action ()
deleteOutput = cmd "rm -rf" [binDir, baseTmpDir]
             --liftIO ∘ mapM_ (flip removeFiles $ ["//*"]) $ [binDir, baseTmpDir]
