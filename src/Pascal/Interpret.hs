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

realExp :: Exp -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (Float, String)
realExp (Op2 "+" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp)
                                     (y, out1) = (realExp e2 out m fp)
                                 in (x + y, out1) 
realExp (Op2 "-" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp)
                                     (y, out1) = (realExp e2 out m fp)
                                 in (x - y, out1) 
realExp (Op2 "/" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp)
                                     (y, out1) = (realExp e2 out m fp)
                                 in (x / y, out1) 
realExp (Op2 "*" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp)
                                     (y, out1) = (realExp e2 out m fp)
                                 in (x * y, out1) 
realExp (Op2 _ _ _) o m fp = error("Stack underflow")

realExp (Op1 "-" e1) o m fp = let (x, out) = (realExp e1 o m fp)
                              in (0- x, out) 

realExp (Op3 "sin" e1) o m fp = let (x, out) = (realExp e1 o m fp)
                                in (sin x, out) 
realExp (Op3 "cos" e1) o m fp = let (x, out) = (realExp e1 o m fp)
                                in (cos x, out) 
realExp (Op3 "exp" e1) o m fp = let (x, out) = (realExp e1 o m fp)
                                in (exp x, out) 
realExp (Op3 "sqrt" e1) o m fp = let (x, out) = (realExp e1 o m fp)
                                in (sqrt x, out) 
realExp (Op3 "ln" e1) o m fp = let (x, out) = (realExp e1 o m fp)
                                in (log x, out) 

realExp (FunCallR s a) o m fp =  let (out, newS, newM, return) = functions s a o m fp
                                in (toFloat(return), out)

realExp (Pascal.Data.Real e1) o m fp = (e1, o)
realExp (IntR e1) o m fp = (fromIntegral e1, o)

realExp (Var s) o m fp = (toFloat(mapLookUp s m), o) 

realExp _ _ _ _ = error("error")

booleanExp :: BoolExp -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (Bool, String)
booleanExp (OpB "and" b1 b2) o m fp = let (x, out) =  (booleanExp b1 o m fp)
                                          (y, out1) =  (booleanExp b2 out m fp)
                                      in (x && y, out1) 
booleanExp (OpB "or" b1 b2) o m fp = let (x, out) =  (booleanExp b1 o m fp)
                                         (y, out1) =  (booleanExp b2 out m fp)
                                      in (x || y, out1) 
booleanExp (Not b1) o m fp = let (x, out) =  (booleanExp b1 o m fp)
                             in (not x, out) 
booleanExp (Comp "=" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp) 
                                         (y, out1) = (realExp e2 out m fp)
                                     in (x == y, out1)
booleanExp (Comp "<>" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp) 
                                          (y, out1) = (realExp e2 out m fp)
                                     in (x /= y, out1)
booleanExp (Comp ">" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp) 
                                         (y, out1) = (realExp e2 out m fp)
                                     in (x > y, out1)
booleanExp (Comp "<" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp) 
                                         (y, out1) = (realExp e2 out m fp)
                                     in (x < y, out1)
booleanExp (Comp "<=" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp) 
                                          (y, out1) = (realExp e2 out m fp)
                                     in (x <= y, out1)
booleanExp (Comp ">=" e1 e2) o m fp = let (x, out) = (realExp e1 o m fp) 
                                          (y, out1) = (realExp e2 out m fp)
                                     in (x >= y, out1)
booleanExp (True_C) o m fp = (True, o)
booleanExp (False_C) o m fp = (False, o)
booleanExp (FunCallB s a) o m fp =  let (out, newS, newM, return) = functions s a o m fp
                                    in (toBool(return), out)
--booleanExp (Pascal.Data.Boolean b1) m = b1
booleanExp (VarB s) o m fp = (toBool(mapLookUp s m), o)

booleanExp _ _ _ _ = error ("error")


assignR :: String -> Exp -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val])
assignR s e o m fp = let (x, out) = (realExp e o m fp)
                     in (out, mapInsert s (floatToVal x) m m [])

assignB :: String -> BoolExp -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val])
assignB s e o m fp = let (x, out) = (booleanExp e o m fp)
                     in (out, mapInsert s (boolToVal x) m m [])

while :: BoolExp -> Statement -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]))
while b s out m fp = 
    let ((loop, stack, fps), bexpr) = evalLoops s out m "no" fp
        (x, o) = booleanExp b loop stack fps
    in if (x) then if (List.isSubsequenceOf bexpr "break") then (o,stack, fps) else while b s o stack fps else (o, stack, fps)

breakLines :: [Line] -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> String
breakLines (x:s) m fp = writeln x m fp ++ breakLines s m fp
breakLines _ _ _ = "" 

writeln :: Line -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> String
writeln (LineId s) m fp =  toString(mapLookUp s m)
writeln (LineS s) m fp =  removePunc s
writeln (LineB b) m fp = let (x, out) = (booleanExp b "" m fp)
                         in out ++ (show x)
writeln (LineR e) m fp = let (x, out) = (realExp e "" m fp)
                         in out ++ (show x)

removePunc :: String -> String
removePunc xs = [ x | x <- xs, not (x `elem` "\"\'") ]


evalLoops ::  Statement -> String -> [Map.Map String Val] -> String -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> ((String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement])), String)
evalLoops (IO "writeln" s) out m b fp= if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m, fp), b) else ((out ++ (breakLines s m fp) ++ "\n", m, fp), b)
evalLoops (EvalR e) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m, fp), b) 
                        else let (x, out1) = (realExp e out m fp)
                             in ((out1, m, fp), b)
evalLoops (EvalB e) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m, fp), b) 
                        else let (x, out1) = (booleanExp e out m fp)
                             in ((out1, m, fp), b)
evalLoops (StopLoop "break") out m b fp = ((out, m, fp), "break")
evalLoops (StopLoop "continue") out m b fp = ((out, m, fp), "continue")
evalLoops (Block s) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m, fp), b) else (breakProgramLoop s out m b fp)
evalLoops (While b s) out m b1 fp = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m, fp), b1) 
                                    else let (x, o) = booleanExp b out m fp
                                         in if (x) then ((while b s o m fp), b1) else ((out, m, fp), b1);
evalLoops (For i start end s) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m, fp), b) else let stack = mapInsert i (intToVal start) m m []
                                                                                                                                    in ((for i start end s out stack fp), b)
evalLoops (If b s1 s2) out m b1 fp = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m, fp), b1) 
                                    else let (x, o) = booleanExp b out m fp
                                         in if (x) then (evalLoops s1 o m b1 fp) else (evalLoops s2 o m b1 fp)
evalLoops (Case "f" b c1 s1 c2 s2) out m b1 fp = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m, fp), b1) 
                                    else let (x, o) = booleanExp b out m fp
                                    in case (x) of 
                                      False -> evalLoops s1 o m b1 fp
                                      True -> evalLoops s2 o m b1 fp
                                      _ -> ((o, m, fp), b1)
evalLoops (Case "t" b c1 s1 c2 s2) out m b1 fp = if(List.isSubsequenceOf b1 "break" || List.isSubsequenceOf b1 "continue") then ((out, m, fp), b1) 
                                    else let (x, o) = booleanExp b out m fp
                                    in case (x) of 
                                      True -> evalLoops s1 o m b1 fp
                                      False -> evalLoops s2 o m b1 fp
                                      _ -> ((o, m, fp), b1)
evalLoops (AssignR s e) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m,fp), b) 
                                    else let (o, map) = (assignR s e out m fp)
                                        in ((o, map , fp), b)
evalLoops (AssignB s e) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m, fp), b) 
                                    else let (o, map) = (assignB s e out m fp)
                                        in ((o, map, fp), b)
evalLoops (Assign x y) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m,fp), b) 
                                    else ((out, mapInsert x (mapLookUp y m) m m [], fp), b)
evalLoops (ProcCall s a) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m,fp), b) 
                                      else ((procedure s a out m fp),b)
evalLoops (FunCall s a) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m,fp), b) 
                                      else ((procedure s a out m fp),b)
evalLoops (AssignFunCall id s a) out m b fp = if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, m,fp), b) 
                                            else let (o, newS, newM, return) = functions s a out m fp
                                                     stack = mapInsert id return newS newS []
                                                 in ((o, stack, newM), b)

breakProgramLoop :: [Statement] -> String -> [Map.Map String Val] -> String -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> ((String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement])), String)
breakProgramLoop (x:program) out s b fp =  if(List.isSubsequenceOf b "break" || List.isSubsequenceOf b "continue") then ((out, s, fp), b) else let ((output, stack, fps), b1) = evalLoops x out s b fp
                                        in breakProgramLoop program output stack b1 fps
breakProgramLoop [] out s b fp = ((out, s, fp), b)

for :: String -> Int -> Int -> Statement -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]))
for i start end s out m fp = let ((loop, stack, fps), bexpr) = evalLoops s out m "no" fp
                                 counter = start + 1
                                 stackmap = mapInsert i (intToVal counter) stack stack []
                          in if( counter >= start && counter <= end) then if (List.isSubsequenceOf bexpr "break") then 
                              (loop,stackmap, fps) 
                              else for i counter end s loop stackmap fps
                              else (loop, stackmap, fps) 

cases :: String -> BoolExp -> Bool -> Statement -> Bool -> Statement -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]))
cases "t" b c1 s1 c2 s2 out m fp = let (x, o) = booleanExp b out m fp
                                    in case x of 
                                      True -> evalStatements s1 o m fp
                                      False -> evalStatements s2 o m fp
                                      _ -> (o, m, fp)
cases "f" b c1 s1 c2 s2 out m fp = let (x, o) = booleanExp b out m fp
                                    in case x of 
                                      False -> evalStatements s1 o m fp
                                      True -> evalStatements s2 o m fp
                                      _ -> (o, m, fp)

evalStatements ::  Statement -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]))
evalStatements (IO "writeln" s) out m fp = (out ++ (breakLines s m fp) ++ "\n", m, fp)
--eval R and eval B, while, for, block, case
evalStatements (EvalR e) out m fp = let (x,o) = realExp e out m fp
                             in (o, m, fp)
evalStatements (EvalB e) out m fp = let (x,o) = booleanExp e out m fp
                             in (o, m, fp)
evalStatements (Block s) out m fp = breakProgram s out m fp
evalStatements (While b s) out m fp = let (x, o) = booleanExp b out m fp
                                    in if (x) then while b s o m fp else (o, m, fp)
evalStatements (For i start end s) out m fp = let stack = mapInsert i (intToVal start) m m []
                                            in for i start end s out stack fp
evalStatements (If b s1 s2) out m fp = let (x, o) = booleanExp b out m fp
                                    in if (x) then (evalStatements s1 o m fp) else (evalStatements s2 o m fp)
evalStatements (Case s b c1 s1 c2 s2) out m fp = cases s b c1 s1 c2 s2 out m fp
evalStatements (AssignR s e) out m fp = let (o, map) = (assignR s e out m fp)
                                        in (o, map, fp)
evalStatements (AssignB s e) out m fp = let (o, map) = (assignB s e out m fp)
                                        in (o, map, fp)
evalStatements (Assign x y) out m fp = (out, mapInsert x (mapLookUp y m) m m [], fp)
evalStatements (StopLoop "break") out m fp = (out, m, fp)
evalStatements (StopLoop "continue") out m fp = (out, m, fp)
evalStatements (ProcCall s a) out m fp = procedure s a out m fp 
evalStatements (FunCall s a) out m fp = procedure s a out m fp 
evalStatements (AssignFunCall id s a) out m fp = let (o, newS, newM, return) = functions s a out m fp
                                                     stack = mapInsert id return newS newS []
                                                 in (o, stack, newM)
                        


procedure :: String -> [Line] -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]))
procedure s a out m fp = let (val, ref, t, d, state) = case Map.lookup s fp :: Maybe ([([String], VType)], [(String, VType)],VType, [Definition],[Statement]) of 
                                                    Just v -> v
                                                    Nothing -> error ("Function or procedure does not exist")
                             (l1, l2) = List.splitAt ((List.length ref)) (List.reverse a)
                             (oy,updated2) = fpAssignV (List.reverse l2) Map.empty val out m fp
                             (ox,updated) = fpAssignR (List.reverse l1) updated2 ref oy m fp
                             new = mapNewScope updated m
                             (fps, var) = breakDef d new fp
                             (output, stack, map) = breakProgram state ox var fps
                             backStack = assignBack (List.reverse l1) stack ref
                             newS = mapPopScope backStack
                             in (output, newS, map)

functions :: String -> [Line] -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]), Val)
functions s a out m fp = let (val, ref, t, d, state) = case (Map.lookup s fp) :: (Maybe ([([String], VType)], [(String, VType)], VType, [Definition],[Statement])) of 
                                                        Just v -> v
                                                        Nothing -> error ("Function or procedure does not exist")
                             (l1, l2) = List.splitAt ((List.length ref)) (List.reverse a)
                             (oy, updated2) = fpAssignV (List.reverse l2) Map.empty val out m fp
                             (ox,updated) = fpAssignR (List.reverse l1) updated2 ref oy m fp
                             new = mapNewScope updated m
                             (fps, var) = breakDef d new fp
                             (output, stack, map) = breakProgram state ox var fps
                             backStack = assignBack (List.reverse l1) stack ref
                             return = mapLookUp s backStack 
                             newS = mapPopScope backStack
                             in (output, newS, map, return)

assignBack :: [Line] -> [Map.Map String Val] -> [(String, VType)] -> [Map.Map String Val]
assignBack (x:l) m ((s,t):r) = let  val = mapLookUp s m
                                    newM = mapInsert (varName x) val m m []
                                in assignBack l newM r
assignBack [] m [] = m

varName :: Line -> String
varName (LineId s) = s
varName _ = error("Not a variable")

fpAssignR :: [Line] -> Map.Map String Val -> [(String, VType)] -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, Map.Map String Val)
fpAssignR (x:l) m ((s,t):r) out q fp = let (o, v) = (line x t q fp)
                                           newM = Map.insert s v m
                                      in fpAssignR l newM r (out++o) q fp
fpAssignR [] m [] out q fp = (out, m)
fpAssignR _ m _ out _ _ = (out, m)

fpAssignV :: [Line] -> Map.Map String Val -> [([String], VType)] -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, Map.Map String Val)
fpAssignV l m ((s,t):r) out q fp = let (o, newM) = fpAssignMult (List.take (List.length s) l) t m s out q fp
                          in fpAssignV (List.drop (List.length s) l) newM r o q fp
fpAssignV [] m [] out q fp = (out, m)
fpAssignV _ m _ out _ _ = (out, m)

fpAssignMult :: [Line] -> VType -> Map.Map String Val -> [String] -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, Map.Map String Val)
fpAssignMult (x:l) t m (y:s) out q fp = let (o, v) = (line x t q fp)
                                            newM = Map.insert y v m
                                      in fpAssignMult l t newM s (out++o) q fp
fpAssignMult [] _ m [] out q fp = (out, m)
fpAssignMult _ _ m _ out _ _ = (out, m)

line :: Line -> VType -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, Val) 
line (LineS s) t m fp = ("", strToVal (removePunc s))
line (LineId s) t m fp = ("", mapLookUp s m)
line (LineB b) t m fp = let (x, o) = (booleanExp b "" m fp) 
                        in (o, boolToVal x)
line (LineR e) t m fp = let (x,o) = (realExp e "" m fp)
                        in (o, floatToVal x)

--let stack = mapNewScope Map.empty m

breakProgram :: [Statement] -> String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> (String, [Map.Map String Val], Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]))
breakProgram (x:program) out s fp =  let (output, stack, fps) = evalStatements x out s fp
                                  in breakProgram program (output) stack fps
breakProgram [] out s fp = (out, s, fp)

listR :: String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType,[Definition],[Statement]) -> [Map.Map String Val]
listR s m fp = let (o, newS) = assignR s (IntR 0) "" m fp
                in newS
listR _ m fp = m

listB :: String -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)],VType, [Definition],[Statement]) -> [Map.Map String Val]
listB s m fp = let (o, newS) = assignB s False_C "" m fp
                in newS
listB _ m fp = m

evalDef :: Definition -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)], VType, [Definition],[Statement]) -> (Map.Map String ([([String], VType)], [(String, VType)], VType, [Definition],[Statement]),[Map.Map String Val])
evalDef (VarDef (x:list) t) m fp = case t of 
                    REAL -> let listr = listR x m fp
                            in evalDef (VarDef list t) listr fp
                    BOOL -> let listb = listB x m fp
                            in evalDef (VarDef list t) listb fp
evalDef (VarDef [] t) m fp = (fp,m)
evalDef (VarDef1 s t) m fp = case t of 
                             REAL -> (fp, listR s m fp)
                             BOOL -> (fp, listB s m fp)
evalDef (R s t e) m fp = let (o, newS)= assignR s e "" m fp
                        in (fp,newS)
evalDef (B s t b) m fp = let (o, newS)= assignB s b "" m fp
                        in (fp,newS)
evalDef (Proc name byValue byRef (d, s)) m fp = (Map.insert name (byValue, byRef, REAL, d, s) fp, m)
evalDef (Func name byValue byRef t (d, s)) m fp = (Map.insert name (byValue, byRef, t, d, s) fp, m)

breakDef :: [Definition] -> [Map.Map String Val] -> Map.Map String ([([String], VType)], [(String, VType)], VType, [Definition],[Statement]) -> (Map.Map String ([([String], VType)], [(String, VType)], VType, [Definition],[Statement]),[Map.Map String Val])
breakDef (x:d) m fp = let (fps, stack) = evalDef x m fp
                    in breakDef d stack fps
breakDef [] m fp = (fp,m)

interpret :: Program -> String
-- TODO: write the interpreter
--interpret (x:program) = evalStatements x
interpret (d, s) = let (fps, varStack) = breakDef d [Map.empty] Map.empty
                       (output, stack, fps2) = breakProgram s "" varStack fps
                    in output
    --let var = []
    --statement = map passVar statements
    --in concat (map evalStatements statements)

interpret _  = "Not implemented"