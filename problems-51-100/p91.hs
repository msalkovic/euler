
colinear :: (Int, Int, Int, Int) -> Bool
colinear (0, _, 0, _) = True
colinear (_, 0, _, 0) = True
colinear (x1, y1, x2, y2) = 
    ((fromIntegral x1) / (fromIntegral x2)) == ((fromIntegral y1) / (fromIntegral y2))

triangle :: (Int, Int, Int, Int) -> Bool
triangle (x1, y1, x2, y2) = let p = x1 ^ 2 + y1 ^ 2
                                q = x2 ^ 2 + y2 ^ 2
                                r = (x2 - x1) ^ 2 + (y2 - y1) ^ 2
                            in (p == q + r) || (q == p + r) || (r == p + q)

count :: Int -> Int
count size = let s = [0, 1 .. size]
                 ps1 = [(x1, y1, x2, y2) | x1 <- s, y1 <- s, x2 <- s, y2 <- s]
                 ps2 = filter (not . colinear) ps1
             in length (filter (==True) (map triangle ps2)) `div` 2

main = do putStrLn (show (count 50))
