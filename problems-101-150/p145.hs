-- This approach is too slow. Switching to Python...
import Data.Char
import Data.List

digits :: Integer -> [Int]
digits x = map digitToInt (show x)

-- "reverse" is a built-in name
rev :: Integer -> Integer
rev x = read (reverse $ show x) :: Integer

reversible :: Integer -> Bool
reversible x = all odd (digits (x + (rev x)))

main = do
    let candidates = filter (\x -> x `mod` 10 /= 0) [1,2..1000]
    let revs = filter reversible candidates 
    putStrLn $ show revs

