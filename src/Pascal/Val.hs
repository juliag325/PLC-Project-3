module Pascal.Val where

import Data.Maybe (isJust)
import Text.Read (readMaybe)

data Val = Integer Int 
    | Real Float
    | Boolean Bool
    | Id String
    deriving (Show, Eq)

-- converts string to Val 
-- sequence tried is Integer, Float, String
strToVal :: String -> Val
strToVal s = case readMaybe s :: Maybe Int of
    Just i -> Integer i
    Nothing -> case readMaybe s :: Maybe Float of
        Just f -> Real f 
        Nothing -> case readMaybe s :: Maybe Bool of
            Just b -> Boolean b
            Nothing -> Id s

-- converts to Float if Real or Integer, error otherwise
-- used to deal with arguments of operators
toFloat :: Val -> Float
toFloat (Real x) = x
toFloat (Integer i) = fromIntegral i     
toFloat (Id _) = error "Not convertible to float"

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
toInt (Id _) = error "Not convertible to int"