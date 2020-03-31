-- Look at how testing is set up in FORTH project and emulate here
-- Make sure you unit test every function you write
-- for maps do for example Map.fromList[(x,y), (c,d)]
-- 

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Val
import Pascal.Data
import Pascal.Interpret
import qualified Data.Map.Strict as Map

main :: IO ()
main = hspec $ do

