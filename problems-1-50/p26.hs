import Data.Char

--digits :: Integer -> [Int]
digits x = map digitToInt (show x)

--rev 0 = 0
--rev x = (x `mod` 10) * (10 ^ (length (digits x) - 1)) + (rev (x `div` 10))


--rev :: Integer -> Integer
rev x = let n = length (digits x) - 1
            p = map (\x -> 10 ^ x) [n, n-1 .. 0]
            t = zip (reverse (digits x)) p
        in  sum (map (\(a, b) -> a * b) t)

--reversible :: Integer -> Bool
reversible x = all odd (digits (x + rev x))

--find :: Integer -> Int
find n = let nums = filter (\x -> x `mod` 10 /= 0) [1..n]
             revs = map reversible nums
         in length (filter (==True) revs)

--main = do putStrLn (show (rev 314))
main = do putStrLn (show (find 1000000))
