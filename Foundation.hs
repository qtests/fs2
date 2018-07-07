-- {-# START_FILE Foundation.hs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

-- show
module Foundation where

import Data.Text

import Yesod

-- data App = App
data App = App [Text]
instance Yesod App

mkYesodData "App" $(parseRoutesFile "config/routes")

getList :: Handler [Text]
getList = do
    App state <- getYesod
    return state
    
-- /show
