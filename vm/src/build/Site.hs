{-# LANGUAGE OverloadedStrings, UnicodeSyntax #-}
module Main where

import Prelude.Unicode

import Development.Shake.FilePath
import Hakyll
import Text.Pandoc.Options

import Paths


main :: IO ()
main = hakyllWith myConfiguration $ do
         
    match "installation-guide/*.md" $ do
        route   $ setExtension ".html"
        compile $ toHtml

    match ("installation-guide/*.sh" .||. "installation-guide/*.png") $ do
        route   idRoute
        compile copyFileCompiler


myConfiguration :: Configuration
myConfiguration = defaultConfiguration
    { providerDirectory    = srcDir 
    , destinationDirectory = binDir
    , storeDirectory       = hakyllTmpDir </> "store"
    , tmpDirectory         = hakyllTmpDir </> "tmp"
    }

toHtml = pandocCompilerWith readerOptions writerOptions
    where
    readerOptions = def
    writerOptions = def { writerHtml5 = True }
