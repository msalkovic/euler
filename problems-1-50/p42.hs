import Data.Char
import Data.List

import qualified Data.Set as Set

toSpace :: String -> String
toSpace s = [if x == ',' then ' ' else x | x <- s, x /= '\"']

letterValue :: Char -> Int
letterValue l = (ord l) - (ord 'A') + 1

wordValue :: String -> Int
wordValue w = sum (map letterValue w)

main = do
    contents <- readFile "words.txt"
    let numbers = Set.fromList [n * (n + 1) `div` 2 | n <- [1..100]]
    let values = map wordValue (words (toSpace contents))
    let solution = length (filter (\x -> Set.member x numbers) values)
    print solution

