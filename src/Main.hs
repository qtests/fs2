module Main where

import Yesod
  
import Dispatch ()
import Foundation
  
-- http://localhost:3000/
main :: IO ()
main = warp 3000 App
