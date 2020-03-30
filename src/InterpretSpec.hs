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
  describe "mapLookUp" $ do
    it "preserves output for numbers" $ do
        mapLookUp "s" [Map.fromList[("s", Id "d")],Map.fromList[("a", Integer 7)]] `shouldBe` (Id "d")
        mapLookUp "test" [Map.fromList[("test", Integer 2)]] `shouldBe` (Integer 2)

  describe "mapPopScope" $ do 
    it "removes from scope" $ do 
      mapPopScope [Map.fromList[("s", Id "d")]] `shouldBe` []
      mapPopScope [Map.fromList[("s", Id "d")], Map.fromList[("t", Integer 5)]] `shouldBe` [Map.fromList[("t", Integer 5)]]
  
  --describe "mapNewScope" $ do
  --describe "mapInsert" $ do   
  
  describe "mapNewScope" $ do 
    it "new scope" $ do 
      mapNewScope (Map.fromList[("s", Integer 4)]) [] `shouldBe` [Map.fromList[("s", Integer 4)]]
      mapNewScope (Map.fromList[("t", Integer 4)]) [Map.fromList[("s", Integer 4)]] `shouldBe` [Map.fromList[("t",Integer 4)], Map.fromList[("s", Integer 4)]]

  describe "mapInsert" $ do 
    it "inserts into map" $ do 
      mapInsert ("s") (Integer 8) [Map.fromList[("a", Integer 5)]] [Map.fromList[("a", Integer 5)]] [Map.fromList[("a", Integer 5)]] `shouldBe` [Map.fromList[("a", Integer 5), ("s", Integer 8)]]
      mapInsert ("s") (Integer 8) [] [] [] `shouldBe` []

  describe "realExp" $ do 
    it "adding two numbers together" $ do
      realExp (Op2 "+" (Pascal.Data.Real 3.5) (Pascal.Data.Real 4.2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.7, "")
      realExp (Op2 "+" (Pascal.Data.IntR 5) (Pascal.Data.IntR 10))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (15, "")
      realExp (Op2 "+" (Pascal.Data.IntR 2) (Pascal.Data.Real 8))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (10, "")
      realExp (Op2 "+" (Pascal.Data.IntR 2) (Pascal.Data.Real 8))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (10, "")


    it "subtracting two numbers together" $ do 
      realExp (Op2 "-" (Pascal.Data.Real 5.5) (Pascal.Data.Real 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (1.5, "")
      realExp (Op2 "-" (Pascal.Data.IntR 10) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (8, "")
      realExp (Op2 "-" (Pascal.Data.IntR 10) (Pascal.Data.Real 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (8, "")
      realExp (Op2 "-" (Pascal.Data.Real 15.5) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (13.5, "")
      realExp (Op2 "-" (Pascal.Data.IntR 3) (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (-2, "")
      
    it "multiplying two numbers together" $ do
      realExp (Op2 "*" (Pascal.Data.IntR 3) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (6, "")
      realExp (Op2 "*" (Pascal.Data.Real 2.2) (Pascal.Data.Real 3.6))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.92, "")
      realExp (Op2 "*" (Pascal.Data.IntR 10) (Pascal.Data.Real 2.2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (22.0, "")
      realExp (Op2 "*" (Pascal.Data.IntR 3) (Pascal.Data.IntR 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (12, "")

    it "divides two numbers together" $ do 
      realExp (Op2 "/" (Pascal.Data.IntR 2) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (1, "")
      realExp (Op2 "/" (Pascal.Data.Real 10) (Pascal.Data.Real 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.5, "")
      realExp (Op2 "/" (Pascal.Data.IntR 10) (Pascal.Data.Real 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (5, "")
      realExp (Op2 "/" (Pascal.Data.Real 8) (Pascal.Data.IntR 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.0, "")

    it "interprets sine function" $ do
      realExp (Op3 "sin" (Pascal.Data.IntR 1))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.84147096, "")
      realExp (Op3 "sin" (Pascal.Data.Real 0.5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.47942555, "")
      realExp (Op3 "sin" (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (-0.9589243, "")

    it "interprets cos function" $ do
      realExp (Op3 "cos" (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.2836622, "")
      realExp (Op3 "cos" (Pascal.Data.Real 0.5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.87758255, "")
      realExp (Op3 "cos" (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.2836622, "")

    it "interprets exp function" $ do 
      realExp (Op3 "exp" (Pascal.Data.IntR 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (54.59815, "")
      realExp (Op3 "exp" (Pascal.Data.Real 22.5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (5.910522e9, "")
      realExp (Op3 "exp" (Pascal.Data.Real 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.389056, "")

    it "interprets sqrt function" $ do 
      realExp (Op3 "exp" (Pascal.Data.IntR 1))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.7182817, "")
      realExp (Op3 "exp" (Pascal.Data.Real 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (148.41316, "")
      realExp (Op3 "exp" (Pascal.Data.Real 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.389056, "")

    it "interprets ln function" $ do
      realExp (Op3 "exp" (Pascal.Data.Real 1))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.7182817, "")
      realExp (Op3 "exp" (Pascal.Data.Real 0.2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (1.2214028, "")
      realExp (Op3 "exp" (Pascal.Data.IntR 20))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (4.8516518e8, "")

  --it "calls a real function" $ do 
      --realExp (FunCallR "fname" [LineS ""]) ("") [] (Map.fromList[("fname" , ([([], REAL)], [("fname",REAL)], REAL, [], [] ))]) `shouldBe` (4, "fname")

  describe "booleanExp" $ do 
    it "and" $ do 
      booleanExp (OpB "and" True_C True_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (OpB "and" False_C True_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (OpB "and" False_C False_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it "and" $ do 
      booleanExp (OpB "or" True_C True_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (OpB "or" False_C True_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (OpB "or" False_C False_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
  
    it "not" $ do 
      booleanExp (Not True_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Not False_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")

    it "=" $ do 
      booleanExp (Comp "=" (Pascal.Data.Real 2) (Pascal.Data.Real 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "=" (Pascal.Data.Real 2) (Pascal.Data.Real 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp "=" (Pascal.Data.Real 2) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")

    it "<>" $ do 
      booleanExp (Comp "<>" (Pascal.Data.Real 2) (Pascal.Data.Real 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp "<>" (Pascal.Data.Real 2) (Pascal.Data.Real 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<>" (Pascal.Data.Real 2) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it ">" $ do 
      booleanExp (Comp ">" (Pascal.Data.Real 2) (Pascal.Data.Real 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp ">" (Pascal.Data.Real 5) (Pascal.Data.Real 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp ">" (Pascal.Data.Real 1) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it "<" $ do 
      booleanExp (Comp "<" (Pascal.Data.Real 2) (Pascal.Data.Real 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp "<" (Pascal.Data.Real 1) (Pascal.Data.Real 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<" (Pascal.Data.Real 4) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it "<=" $ do 
      booleanExp (Comp "<=" (Pascal.Data.Real 2) (Pascal.Data.Real 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<=" (Pascal.Data.Real 2) (Pascal.Data.Real 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<=" (Pascal.Data.Real 4) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it ">=" $ do 
      booleanExp (Comp ">=" (Pascal.Data.Real 5) (Pascal.Data.Real 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp ">=" (Pascal.Data.Real 2) (Pascal.Data.Real 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp ">=" (Pascal.Data.Real 2) (Pascal.Data.IntR 5)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
    
    it "True_C" $ do 
      booleanExp (True_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (False_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    --funcallB
    --error

  --describe "writeln" $ do 
    --writeln (Pascal.Data.LineS "j") [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("hey")
  




--Line -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> String

    









   