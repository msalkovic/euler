import Data.Char

digits :: Integer -> [Int]
digits x = map digitToInt (show x)

increasing :: [Int] -> Bool
increasing [x]    = True
increasing [x, y] = x <= y
increasing (x:xs) = x <= head xs && increasing xs

decreasing :: [Int] -> Bool
decreasing [x]    = True
decreasing [x, y] = x >= y
decreasing (x:xs) = x >= head xs && decreasing xs

bouncy :: Integer -> Bool
bouncy x = (not (increasing d)) && (not (decreasing d))
        where d = digits x


main = do
    --let max_  = 1587000 -- binarno pretrazio :)
    let max_  = 20000000
    let bs    = filter bouncy [1,2..max_]
    let ratio = (fromIntegral (length bs)) / (fromIntegral max_)
    putStrLn (show ratio)

