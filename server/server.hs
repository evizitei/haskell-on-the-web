{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Network.Wai.Middleware.Static
import Network.Wai.Middleware.RequestLogger

main :: IO ()
main = do
    putStrLn "Starting server on port 3000..."
    scotty 3000 $ do
        middleware logStdoutDev
        -- Serve static files from the current directory
        middleware $ staticPolicy (noDots >-> addBase ".")
        get "/" $ do
            text "Hello from haskell server!"
        notFound $ text "File not found!"
