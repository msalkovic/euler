import Data.List

powerMod :: Integer -> Integer -> Integer-> Integer
powerMod _ _ 0 = 1
powerMod _ x 1 = x
powerMod m x p = (x * (powerMod m x (p - 1))) `mod` m


main = do
	let m = 10000000000
	let xs = map (\x -> powerMod m x x) [1..1000]
	putStrLn (show ((sum xs) `mod` m))

