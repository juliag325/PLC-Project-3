module Pascal.Val (
    Val(..),
    strToVal,
    toFloat,
    toString,
    toInt,
    toBool,
    floatToVal,
    boolToVal,
    intToVal
)where
-- this file contains definitions for Val and aux functions

import Data.Maybe (isJust)
import Text.Read (readMaybe)

-- The values manipulated by FORTH
data Val = Integer Int 
    | Real Float
    | Boolean Bool 
    | Id String
    deriving (Show, Eq)

floatToVal :: Float -> Val
floatToVal f = Real f

intToVal :: Int -> Val
intToVal i = Integer i

boolToVal :: Bool -> Val
boolToVal b = Boolean b

-- converts string to Val 
-- sequence tried is Integer, Float, String
strToVal :: String -> Val
strToVal s = Id s

-- converts to Float if Real or Integer, error otherwise
-- used to deal with arguments of operators
toFloat :: Val -> Float
toFloat (Real x) = x
toFloat (Integer i) = fromIntegral i 
toFloat (Boolean b) = error "Not convertible to float"
toFloat (Id _) = error "Not convertible to float"

toBool :: Val -> Bool
toBool (Boolean b) = b
toBool (Integer i) =  error "Not convertible to bool"
toBool (Real x) = error "Not convertible to bool"
toBool (Id _) = error "Not convertible to bool"

-- converts to String
toString :: Val -> String
toString (Id s) = s
toString (Real x) = show x
toString (Integer i) = show i
toString (Boolean b) = show b

-- converts to Integer if Real or Integer, error otherwise
toInt :: Val -> Int
toInt (Real x) = round x
toInt (Integer i) = i
toInt (Boolean b) = fromEnum b
toInt (Id _) = error "Not convertible to int"