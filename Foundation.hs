-- {-# START_FILE Foundation.hs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

-- show
module Foundation where

import Data.Text
import Control.Concurrent.STM

import Yesod

-- data App = App
-- data App = App [Text]
data App = App (TVar [Text])

instance Yesod App

mkYesodData "App" $(parseRoutesFile "config/routes")

getList :: Handler [Text]
getList = do
--     App state <- getYesod
--     return state
   App tstate <- getYesod
   liftIO $ readTVarIO tstate

addFile :: App -> Text -> Handler ()
addFile (App tstore) op =
    liftIO . atomically $ do
    modifyTVar tstore $ \ ops -> op : ops

-- /show
