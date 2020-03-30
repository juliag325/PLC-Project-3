-- HSpec tests for Val.hs
-- Execute: runhaskell ValSpec.hs

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Pascal.Val

main :: IO ()
main = hspec $ do
  describe "strToVal" $ do
    it "converts an integer string" $ do
        strToVal "2" `shouldBe` Id "2"

    it "converts a float string" $ do
        strToVal "2.0" `shouldBe` Id "2.0"

    it "converts a string" $ do
        strToVal "x2" `shouldBe` Id "x2"

  describe "toFloat" $ do  
      it "preserves real" $ do
          toFloat (Real 2.0) `shouldBe` (2.0::Float)
        
      it "converts integers" $ do
          toFloat (Integer 2) `shouldBe` (2.0::Float)

      it "errors on non-numbers" $ do
          -- this case is somewhat tricky
          evaluate (toFloat (Id "x")) `shouldThrow` errorCall "Not convertible to float"

  describe "toString" $ do  
      it "real to string" $ do
          toString (Real 2.0) `shouldBe` ("2.0"::String)
        
      it "integers to string" $ do
          toString (Integer 2) `shouldBe` ("2"::String)
      
      it "preserves strings" $ do
          toString (Id "2") `shouldBe` ("2"::String)

  describe "toInt" $ do  
      it "converts real" $ do
          toInt (Real 2.0) `shouldBe` (2::Int)
        
      it "preserves integers" $ do
          toInt (Integer 2) `shouldBe` (2::Int)

      it "errors on non-numbers" $ do
          -- this case is somewhat tricky
          evaluate (toInt (Id "x")) `shouldThrow` errorCall "Not convertible to int"


