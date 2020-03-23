module Pascal.Interpret 
(
    interpret
)
where

import Pascal.Data
--import Pascal.Map as Map
import Pascal.Val as Val
import Data.Some
import qualified Data.Map.Strict as Map
import Data.Maybe (isJust)
import Text.Read (readMaybe)
import Data.List as List

-- TODO: define auxiliary functions to aid interpretation
-- Feel free to put them here or in different modules
-- Hint: write separate evaluators for numeric and
-- boolean expressions and for statements

-- make sure you write test unit cases for all functions


{-getIdValueR:: String -> Val

getIdValueS:: String -> String

getIdValueB:: String -> Bool-}

mapLookUp :: String -> [Map.Map String Val] -> Val
mapLookUp s (x:stack) = case (Map.lookup s x) :: Maybe Val of
                        Just v -> v
                        Nothing -> mapLookUp s stack
mapLookUp s [] = error("Variable does not exist")

mapInsert :: String -> Val -> [Map.Map String Val] -> [Map.Map String Val] -> [Map.Map String Val] -> [Map.Map String Val]
--need to fix
mapInsert s val (x:stack) original updated = case (Map.lookup s x) :: Maybe Val of
                        Just v -> List.reverse (List.reverse((Map.insert s val x) : stack) ++ updated)
                        Nothing -> mapInsert s val stack original (x:updated)
mapInsert s val [] (x:original) updated = (Map.insert s val x) : original
mapInsert s val _ _ _ = []

mapNewScope :: Map.Map String Val -> [Map.Map String Val] -> [Map.Map String Val]
mapNewScope m s = (m:s)

mapPopScope :: [Map.Map String Val] -> [Map.Map String Val] 
mapPopScope (x:s) = s
mapPopScope [] = []

realExp :: Exp -> [Map.Map String Val] -> Float
realExp (Op2 "+" e1 e2) m = (realExp e1 m) + (realExp e2 m)
realExp (Op2 "-" e1 e2) m = (realExp e1 m) - (realExp e2 m)
realExp (Op2 "/" e1 e2) m = (realExp e1 m) / (realExp e2 m)
realExp (Op2 "*" e1 e2) m = (realExp e1 m) * (realExp e2 m)
realExp (Op2 _ _ _) m = error("Stack underflow")

realExp (Op1 "-" e1) m = 0 - (realExp e1 m)

realExp (Op3 "sin" e1) m = sin (realExp e1 m)
realExp (Op3 "cos" e1) m = cos (realExp e1 m)
realExp (Op3 "exp" e1) m = exp (realExp e1 m)
realExp (Op3 "sqrt" e1) m = sqrt (realExp e1 m)
realExp (Op3 "ln" e1) m = log (realExp e1 m)

realExp (Pascal.Data.Real e1) m = e1
realExp (IntR e1) m = fromIntegral e1

realExp (Var s) m = toFloat(mapLookUp s m) 

realExp _ _ = error("error")

booleanExp :: BoolExp -> [Map.Map String Val] -> Bool
booleanExp (OpB "and" b1 b2) m = (booleanExp b1 m) && (booleanExp b2 m)
booleanExp (OpB "or" b1 b2) m = (booleanExp b1 m) || (booleanExp b2 m)
booleanExp (Not b1) m = not (booleanExp b1 m)
booleanExp (Comp "=" e1 e2) m = (realExp e1 m) == (realExp e2 m)
booleanExp (Comp "<>" e1 e2) m = (realExp e1 m) /= (realExp e2 m)
booleanExp (Comp ">" e1 e2) m = (realExp e1 m) > (realExp e2 m)
booleanExp (Comp "<" e1 e2) m = (realExp e1 m) < (realExp e2 m)
booleanExp (Comp "<=" e1 e2) m = (realExp e1 m) <= (realExp e2 m)
booleanExp (Comp ">=" e1 e2) m = (realExp e1 m) >= (realExp e2 m)
booleanExp (True_C) m = True
booleanExp (False_C) m = False
--booleanExp (Pascal.Data.Boolean b1) m = b1
booleanExp (VarB s) m = toBool(mapLookUp s m)

booleanExp _ _ = error ("error")


assignR :: String -> Exp -> [Map.Map String Val] -> [Map.Map String Val]
assignR s e m = mapInsert s (floatToVal (realExp e m)) m m []

assignB :: String -> BoolExp -> [Map.Map String Val] -> [Map.Map String Val]
assignB s e m = mapInsert s (boolToVal (booleanExp e m)) m m []

while :: BoolExp -> Statement -> String -> [Map.Map String Val] -> (String, [Map.Map String Val])
while b s out m = 
    let ((loop, stack), bexpr) = evalLoops s out m "no"
    in if (booleanExp b stack) then if (List.isSubsequenceOf bexpr "break") then (loop,stack) else while b s loop stack else (loop, stack)

breakLines :: [Line] -> [Map.Map String Val] -> String
breakLines (x:s) m = writeln x m ++ breakLines s m
breakLines _ _ = "" 

writeln :: Line -> [Map.Map String Val] -> String
writeln (LineId s) m =  toString(mapLookUp s m)
writeln (LineS s) m =  s
writeln (LineB b) m = show(booleanExp b m)
writeln (LineR e) m = show(realExp e m)


evalLoops ::  Statement -> String -> [Map.Map String Val] -> String -> ((String, [Map.Map String Val]), String)
evalLoops (IO "writeln" s) out m b = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m), b) else ((out ++ (breakLines s m) ++ "\n", m), b)
evalLoops (EvalR e) out m b = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m), b) else let o = show (realExp e m)
                             in ((out, m), b)
evalLoops (EvalB e) out m b = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m), b) else let o = show (booleanExp e m)
                             in ((out, m), b)
evalLoops (StopLoop "break") out m b = ((out, m), "break")
evalLoops (StopLoop "continue") out m b = ((out, m), "continue")
evalLoops (Block s) out m b = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m), b) else (breakProgramLoop s out m b)
evalLoops (While b s) out m b1 = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m), b1) else if (booleanExp b m) then ((while b s out m), b1) else ((out, m), b1);
evalLoops (For i start end s) out m b = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m), b) else let stack = mapInsert i (intToVal start) m m []
                                                                                                                                    in ((for i start end s out stack), b)
evalLoops (If b s1 s2) out m b1 = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m), b1) else if (booleanExp b m) then (evalLoops s1 out m b1) else (evalLoops s2 out m b1)
evalLoops (Case "f" b c1 s1 c2 s2) out m b1 = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m), b1) else case (booleanExp b m) of 
                                      False -> evalLoops s1 out m b1
                                      True -> evalLoops s2 out m b1
                                      _ -> ((out, m), b1)
evalLoops (Case "t" b c1 s1 c2 s2) out m b1 = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m), b1) else case (booleanExp b m) of 
                                      True -> evalLoops s1 out m b1
                                      False -> evalLoops s2 out m b1
                                      _ -> ((out, m), b1)
evalLoops (AssignR s e) out m b = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m), b) else ((out, (assignR s e m)), b)
evalLoops (AssignB s e) out m b = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m), b) else ((out, (assignB s e m)), b)

breakProgramLoop :: [Statement] -> String -> [Map.Map String Val] -> String -> ((String, [Map.Map String Val]), String)
breakProgramLoop (x:program) out s b =  if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, s), b) else let ((output, stack), b1) = evalLoops x out s b
                                        in breakProgramLoop program output stack b1
breakProgramLoop [] out s b = ((out, s), b)

for :: String -> Int -> Int -> Statement -> String -> [Map.Map String Val] -> (String, [Map.Map String Val])
for i start end s out m = let ((loop, stack), bexpr) = evalLoops s out m "no"
                              counter = start + 1
                              stackmap = mapInsert i (intToVal counter) stack stack []
                          in if( counter >= start && counter <= end) then if (List.isSubsequenceOf bexpr "break") then 
                              (loop,stackmap) 
                              else for i counter end s loop stackmap 
                              else (loop, stackmap) 

cases :: String -> BoolExp -> Bool -> Statement -> Bool -> Statement -> String -> [Map.Map String Val] -> (String, [Map.Map String Val])
cases "t" b c1 s1 c2 s2 out m = case booleanExp b m of 
                                      True -> evalStatements s1 out m
                                      False -> evalStatements s2 out m
                                      _ -> (out, m)
cases "f" b c1 s1 c2 s2 out m = case booleanExp b m of 
                                      False -> evalStatements s1 out m
                                      True -> evalStatements s2 out m
                                      _ -> (out, m)

evalStatements ::  Statement -> String -> [Map.Map String Val] -> (String, [Map.Map String Val])
evalStatements (IO "writeln" s) out m = (out ++ (breakLines s m) ++ "\n", m)
evalStatements (EvalR e) out m = let o = show (realExp e m)
                             in (out, m)
evalStatements (EvalB e) out m = let o = show (booleanExp e m)
                             in (out, m)
evalStatements (Block s) out m = breakProgram s out m
evalStatements (While b s) out m = if (booleanExp b m) then while b s out m else (out, m)
evalStatements (For i start end s) out m = let stack = mapInsert i (intToVal start) m m []
                                            in for i start end s out stack
evalStatements (If b s1 s2) out m = if (booleanExp b m) then (evalStatements s1 out m) else (evalStatements s2 out m)
evalStatements (Case s b c1 s1 c2 s2) out m = cases s b c1 s1 c2 s2 out m
evalStatements (AssignR s e) out m = (out, (assignR s e m))
evalStatements (AssignB s e) out m = (out, (assignB s e m))
evalStatements (StopLoop "break") out m = (out, m)
evalStatements (StopLoop "continue") out m = (out, m)

--let stack = mapNewScope Map.empty m

breakProgram :: [Statement] -> String -> [Map.Map String Val] -> (String, [Map.Map String Val])
breakProgram (x:program) out s =  let (output, stack) = evalStatements x out s 
                                  in breakProgram program (output) stack
breakProgram [] out s = (out, s)

interpret :: Program -> String
-- TODO: write the interpreter
--interpret (x:program) = evalStatements x
interpret program = let (output, stack) = breakProgram program "" [Map.empty]
                    in output
    --let var = []
    --statement = map passVar statements
    --in concat (map evalStatements statements)

interpret _  = "Not implemented"