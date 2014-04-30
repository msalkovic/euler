factorial :: Integer -> Integer
factorial 0 = 1
factorial n = product [1..n]

comb :: Integer -> Integer -> Integer
comb 1 _ = 1
comb _ 1 = 1
comb n r = (factorial n) `div` ((factorial r) * (factorial (n - r)))

main = do putStrLn $ show $ length [(n, r) | n <- [1..100], r <- [1..n], comb n r > 1000000]

