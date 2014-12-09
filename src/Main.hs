{-# LANGUAGE OverloadedStrings #-}
import Hakyll

config :: Configuration
config = defaultConfiguration
           { destinationDirectory = "raphaelnova.github.io" }

main :: IO ()
main = hakyllWith config $ do
    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["LICENSE", "CNAME"]) $ do
        route   idRoute
        compile copyFileCompiler

    match "index.md" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext

    match "templates/*" $ compile templateCompiler

