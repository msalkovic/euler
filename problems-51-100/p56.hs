import Data.Char
import Data.List

digitsum :: Integer -> Int
digitsum x = sum $ map digitToInt $ show x

build :: Integer -> [Integer]
build n = snd (mapAccumL pow 1 array)
       where pow = \acc x -> (acc + 1, x ^ ((acc - 1) `rem` n))
             array = concat (map (\x -> take (fromInteger n) (repeat x)) [1..n])

maxsum :: [Integer] -> Int
maxsum xs = fst $ last $ sort $ zip (map digitsum xs) [0..]

main = do
    putStrLn $ show $ maxsum $ build 99

