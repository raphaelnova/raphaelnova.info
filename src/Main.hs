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

    match (fromList ["index.html", "LICENSE", "CNAME"]) $ do
        route   idRoute
        compile copyFileCompiler

