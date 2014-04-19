import Data.Char

digits :: Integer -> [Int]
digits x = map digitToInt (show x)

rev :: Integer -> Integer
rev 0 = 0
rev x = (x `mod` 10) * (10 ^ (length (digits x) - 1)) + (rev (x `div` 10))

isPalindrome :: Integer -> Bool
isPalindrome x = let ds = digits x 
                 in  ds == reverse ds

isLynchrel :: Int -> Integer -> Bool
isLynchrel c x
    | c == 50        = True
    | isPalindrome y = False
    | otherwise      = isLynchrel (c + 1) y
    where y = x + rev x

findAll :: Integer -> Int
findAll max_ = length (filter (==True) (map (isLynchrel 0) [1,2..max_]))

main = do putStrLn (show (findAll 9999))

