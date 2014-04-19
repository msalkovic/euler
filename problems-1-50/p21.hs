
divisors :: Int -> [Int]
divisors n = [1] ++ divs ++ [n `div` x | x <- reverse divs]
    where divs = [x | x <- [2,3..m], n `mod` x == 0]
          m    = round (sqrt (fromIntegral n))

amicable :: Int -> Int -> Bool
amicable m n = m /= n && sum (divisors m) == n && sum (divisors n) == m

result :: Int -> Int
result max_ = sum [x | x <- [1..max_], y <- [1..max_], amicable x y]

main = do putStrLn $ show $ result 1000
