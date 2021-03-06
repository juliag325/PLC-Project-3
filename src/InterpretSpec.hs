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
      realExp (Op2 "+" (Pascal.Data.Reall 3.5) (Pascal.Data.Reall 4.2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.7, "")
      realExp (Op2 "+" (Pascal.Data.IntR 5) (Pascal.Data.IntR 10))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (15, "")
      realExp (Op2 "+" (Pascal.Data.IntR 2) (Pascal.Data.Reall 8))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (10, "")
      realExp (Op2 "+" (Pascal.Data.IntR 2) (Pascal.Data.Reall 8))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (10, "")


    it "subtracting two numbers together" $ do 
      realExp (Op2 "-" (Pascal.Data.Reall 5.5) (Pascal.Data.Reall 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (1.5, "")
      realExp (Op2 "-" (Pascal.Data.IntR 10) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (8, "")
      realExp (Op2 "-" (Pascal.Data.IntR 10) (Pascal.Data.Reall 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (8, "")
      realExp (Op2 "-" (Pascal.Data.Reall 15.5) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (13.5, "")
      realExp (Op2 "-" (Pascal.Data.IntR 3) (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (-2, "")
      
    it "multiplying two numbers together" $ do
      realExp (Op2 "*" (Pascal.Data.IntR 3) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (6, "")
      realExp (Op2 "*" (Pascal.Data.Reall 2.2) (Pascal.Data.Reall 3.6))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.92, "")
      realExp (Op2 "*" (Pascal.Data.IntR 10) (Pascal.Data.Reall 2.2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (22.0, "")
      realExp (Op2 "*" (Pascal.Data.IntR 3) (Pascal.Data.IntR 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (12, "")

    it "divides two numbers together" $ do 
      realExp (Op2 "/" (Pascal.Data.IntR 2) (Pascal.Data.IntR 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (1, "")
      realExp (Op2 "/" (Pascal.Data.Reall 10) (Pascal.Data.Reall 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.5, "")
      realExp (Op2 "/" (Pascal.Data.IntR 10) (Pascal.Data.Reall 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (5, "")
      realExp (Op2 "/" (Pascal.Data.Reall 8) (Pascal.Data.IntR 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.0, "")

    it "interprets sine function" $ do
      realExp (Op3 "sin" (Pascal.Data.IntR 1))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.84147096, "")
      realExp (Op3 "sin" (Pascal.Data.Reall 0.5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.47942555, "")
      realExp (Op3 "sin" (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (-0.9589243, "")

    it "interprets cos function" $ do
      realExp (Op3 "cos" (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.2836622, "")
      realExp (Op3 "cos" (Pascal.Data.Reall 0.5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.87758255, "")
      realExp (Op3 "cos" (Pascal.Data.IntR 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (0.2836622, "")

    it "interprets exp function" $ do 
      realExp (Op3 "exp" (Pascal.Data.IntR 4))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (54.59815, "")
      realExp (Op3 "exp" (Pascal.Data.Reall 22.5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (5.910522e9, "")
      realExp (Op3 "exp" (Pascal.Data.Reall 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.389056, "")

    it "interprets sqrt function" $ do 
      realExp (Op3 "exp" (Pascal.Data.IntR 1))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.7182817, "")
      realExp (Op3 "exp" (Pascal.Data.Reall 5))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (148.41316, "")
      realExp (Op3 "exp" (Pascal.Data.Reall 2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (7.389056, "")

    it "interprets ln function" $ do
      realExp (Op3 "exp" (Pascal.Data.Reall 1))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (2.7182817, "")
      realExp (Op3 "exp" (Pascal.Data.Reall 0.2))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (1.2214028, "")
      realExp (Op3 "exp" (Pascal.Data.IntR 20))  ("") [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` (4.8516518e8, "")

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
      booleanExp (Comp "=" (Pascal.Data.Reall 2) (Pascal.Data.Reall 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "=" (Pascal.Data.Reall 2) (Pascal.Data.Reall 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp "=" (Pascal.Data.Reall 2) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")

    it "<>" $ do 
      booleanExp (Comp "<>" (Pascal.Data.Reall 2) (Pascal.Data.Reall 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp "<>" (Pascal.Data.Reall 2) (Pascal.Data.Reall 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<>" (Pascal.Data.Reall 2) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it ">" $ do 
      booleanExp (Comp ">" (Pascal.Data.Reall 2) (Pascal.Data.Reall 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp ">" (Pascal.Data.Reall 5) (Pascal.Data.Reall 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp ">" (Pascal.Data.Reall 1) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it "<" $ do 
      booleanExp (Comp "<" (Pascal.Data.Reall 2) (Pascal.Data.Reall 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
      booleanExp (Comp "<" (Pascal.Data.Reall 1) (Pascal.Data.Reall 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<" (Pascal.Data.Reall 4) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it "<=" $ do 
      booleanExp (Comp "<=" (Pascal.Data.Reall 2) (Pascal.Data.Reall 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<=" (Pascal.Data.Reall 2) (Pascal.Data.Reall 4)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp "<=" (Pascal.Data.Reall 4) (Pascal.Data.IntR 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

    it ">=" $ do 
      booleanExp (Comp ">=" (Pascal.Data.Reall 5) (Pascal.Data.Reall 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp ">=" (Pascal.Data.Reall 2) (Pascal.Data.Reall 2)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (Comp ">=" (Pascal.Data.Reall 2) (Pascal.Data.IntR 5)) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")
    
    it "True_C" $ do 
      booleanExp (True_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (True, "")
      booleanExp (False_C) ("") [] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` (False, "")

  describe "assignR" $ do 
    it "assign value to real type" $ do 
      assignR ("int") (Pascal.Data.IntR 3) ("a") [Map.fromList[("a", Integer 3)]] (Map.fromList[("fname" , ([([], REAL)], [("fname",REAL)], REAL, [], [] ))]) `shouldBe` ("a",[Map.fromList [("a",Integer 3),("int", Pascal.Val.Real 3.0)]])
      assignR ("real") (Pascal.Data.Reall 5) ("s") [Map.fromList[("s", Pascal.Val.Real 3.0)]] (Map.fromList[("fname" , ([([], REAL)], [("fname",REAL)], REAL, [], [] ))]) `shouldBe` ("s",[Map.fromList [("s",Pascal.Val.Real 3.0),("real", Pascal.Val.Real 5.0)]])
      assignR ("real") (Pascal.Data.Reall 2) ("t") [Map.fromList[("t", Pascal.Val.Real 2.0)]] (Map.fromList[("fname" , ([([], REAL)], [("fname",REAL)], REAL, [], [] ))]) `shouldBe` ("t",[Map.fromList [("t",Pascal.Val.Real 2.0),("real", Pascal.Val.Real 2.0)]])

  describe "assignB" $ do 
    it "assign value to boolean type" $ do 
      assignB ("bool") (Pascal.Data.True_C) ("s") [Map.fromList[("s", Pascal.Val.Boolean True)]] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` ("s",[Map.fromList [("s",Pascal.Val.Boolean True),("bool", Pascal.Val.Boolean True)]])
      assignB ("bool") (Pascal.Data.False_C) ("t") [Map.fromList[("t", Pascal.Val.Boolean False)]] (Map.fromList[("fname" , ([([], BOOL)], [("fname",BOOL)], BOOL, [], [] ))]) `shouldBe` ("t",[Map.fromList [("t",Pascal.Val.Boolean False),("bool", Pascal.Val.Boolean False)]])

  describe "breakLines" $ do 
    it "breaks lines" $ do 
      breakLines [LineS "a"] [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` "a"
      breakLines [LineS "basdfaafda"] [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` "basdfaafda"

  describe "removePunc" $ do
    it "removes punctuation" $ do
      removePunc "hey'" `shouldBe` "hey"

  describe "assignBack" $ do
    it "assigns back" $ do
      assignBack [LineS "a"] [] [("a", STRING)] `shouldBe` []
      assignBack [LineS "b"] [] [("a", STRING)] `shouldBe` []
      assignBack [LineB Pascal.Data.True_C] [] [("a", STRING)] `shouldBe` []

  describe "varName" $ do 
    it "variable name" $ do 
      varName (LineId "s") `shouldBe` "s"
      varName (LineId "asdf") `shouldBe` "asdf"

  describe "Line" $ do
    it "lines" $ do
      line (LineS "soooo") (STRING) [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("", Id "soooo")
      line (LineB Pascal.Data.True_C) (STRING) [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("", Boolean True)
      --line (LineR Pascal.Val.Integer 3) (REAL) [] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` ("", Boolean True)

  describe "listR" $ do 
    it "list of reals" $ do
      listR ("s") [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` []
      listR ("t") [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` []
      listR ("1") [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` []

  describe "listB" $ do 
    it "list of booleans" $ do
      listB ("s") [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` []
      listB ("t") [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` []
      listB ("1") [] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` []

  describe "FpAssignMult" $ do 
    it "assigns mult to functions" $ do 
      fpAssignMult [LineId "s"] (STRING) (Map.fromList[("s", Integer 5)]) ["s"] ("s") [Map.fromList[("s", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("s", Map.fromList[("s", Integer 5)])
      fpAssignMult [LineS "s"] (STRING) (Map.fromList[("s", Integer 5)]) ["s"] ("s") [Map.fromList[("s", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("s", Map.fromList[("s", Id "s")])
      --fpAssignMult [LineR 5] (REAL) (Map.fromList[("s", 5)]) ["s"] ("s") [Map.fromList[("s", 4)]] (Map.fromList[("fname" , ([([], REAL)], [("",REAL)], REAL, [], [] ))]) `shouldBe` ("s", Map.fromList[("s", Id "s")])

    describe "FpAssignR" $ do 
      it "assigns real to functions" $ do 
        fpAssignR [LineId "s"] (Map.fromList[("s", Integer 5)]) [] ("s") [Map.fromList[("s", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("s", Map.fromList[("s", Integer 5)])
        fpAssignR [LineS "t"] (Map.fromList[("t", Integer 5)]) [] ("t") [Map.fromList[("t", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("t", Map.fromList[("t", Integer 5)])

    describe "FpAssignV" $ do 
      it "assigns real to functions" $ do 
        fpAssignV [LineId "s"] (Map.fromList[("s", Integer 5)]) [(["s"], STRING)] ("s") [Map.fromList[("s", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("s", Map.fromList[("s", Integer 5)])
        fpAssignV [LineS "t"] (Map.fromList[("t", Integer 5)]) [(["t"], STRING)] ("t") [Map.fromList[("t", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("",STRING)], STRING, [], [] ))]) `shouldBe` ("t", Map.fromList[("t", Id "t")])

    describe "writeln" $ do 
      it "writeln" $ do 
        writeln (LineId "s") [Map.fromList[("s", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("s",STRING)], STRING, [], [] ))]) `shouldBe` "5"
        writeln (LineS "t") [Map.fromList[("s", Integer 9)]] (Map.fromList[("fname" , ([([], STRING)], [("t",STRING)], STRING, [], [] ))]) `shouldBe` "t"
        writeln (LineB True_C) [Map.fromList[("s", Integer 5)]] (Map.fromList[("fname" , ([([], STRING)], [("s",STRING)], STRING, [], [] ))]) `shouldBe` "True"




        

--Line -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> String







   