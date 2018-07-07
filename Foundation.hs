-- {-# START_FILE Foundation.hs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

-- show
module Foundation where

import Yesod

data App = App
instance Yesod App

mkYesodData "App" $(parseRoutesFile "config/routes")
-- /show
