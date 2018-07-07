-- {-# START_FILE Handler/Home.hs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

-- show
module Handler.Home where

import Data.Default
import Yesod
import Yesod.Default.Util

import Foundation

getHomeR :: Handler Html
getHomeR = do
    let filenames = ["readme.txt", "report.pdf", "music.wav"] :: [String]
    defaultLayout $ do
        setTitle "File Processor"
        $(widgetFileNoReload def "home")
