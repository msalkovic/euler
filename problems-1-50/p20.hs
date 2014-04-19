-- Problem 20.
import Data.Char

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

digitSum :: (Integral a) => a -> a
digitSum 0 = 0
digitSum n = mod n 10 + digitSum (div n 10)

--alternative solution
--digitSum' :: (Integral a -> Int b) => a -> b
digitSum' n = sum $ map digitToInt $ show n

main = do putStrLn $ show $ digitSum' $ factorial 100
--ili:
--main = do putStrLn (show (digitSum (factorial 100)))
