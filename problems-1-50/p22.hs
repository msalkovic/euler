import Data.Char
import Data.List

toSpace :: String -> String
toSpace cs = [if x == ',' then ' ' else x | x <- cs, x /= '\"']

alphaVal :: String -> Integer
alphaVal []  = 0
alphaVal xs = sum (map (\c -> toInteger(ord c) - 64) xs)

total :: [String] -> Integer
total xs = let vals = map alphaVal (sort xs)
               (_, ys) = mapAccumL (\acc x -> (acc + 1, x * acc)) 1 vals
           in sum ys

main = do
    contents <- readFile "names.txt"
    print (total (words (toSpace contents)))
		
