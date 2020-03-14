module Pascal.Eval 
(
    eval
)
where

import Pascal.Val

eval :: String -> [Val] -> [Val]

-- Exponent
-- if arguments are integers, keep result as integer
eval "^" (Integer x: Integer y:tl) = Integer (y^x) : tl
-- if any argument is float, make result a float
eval "^" (x:y:tl) = (Real $ toFloat y ** toFloat x) : tl 
-- any remaining cases are stacks too short
eval "^" _ = error("Stack underflow")

-- Multiplication
-- if arguments are integers, keep result as integer
eval "*" (Integer x: Integer y:tl) = Integer (y*x) : tl
-- if any argument is float, make result a float
eval "*" (x:y:tl) = (Real $ toFloat y * toFloat x) : tl 
-- any remaining cases are stacks too short
eval "*" _ = error("Stack underflow")

-- Division
-- if arguments are integers, keep result as integer
eval "/" (Integer x: Integer y:tl) = case x of 
    0 -> error("Can't divide by 0")
    _ -> (Integer $ floor (toFloat (strToVal (show y)) / toFloat (strToVal(show x)))) : tl 
-- if any argument is float, make result a float
eval "/" (x: y:tl) = case toFloat x of 
    0.0 -> error("Can't divide by 0")
    _ -> (Real $ toFloat y / toFloat x) : tl 
-- any remaining cases are stacks too short
eval "/" _ = error("Stack underflow")

-- Addition
-- if arguments are integers, keep result as integer
eval "+" (Integer x: Integer y:tl) = Integer (y+x) : tl
-- if any argument is float, make result a float
eval "+" (x:y:tl) = (Real $ toFloat y + toFloat x) : tl 
-- any remaining cases are stacks too short
eval "+" _ = error("Stack underflow")

-- Subtraction
-- if arguments are integers, keep result as integer
eval "-" (Integer x: Integer y:tl) = Integer (y-x) : tl
-- if any argument is float, make result a float
eval "-" (x:y:tl) = (Real $ toFloat y - toFloat x) : tl 
-- any remaining cases are stacks too short
eval "-" _ = error("Stack underflow")