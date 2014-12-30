-- To pay out a certain sum with a (sorted) list of coins, I can
-- (1) reduce the sum by paying the biggest coin first, or
-- (2) use all but the biggest coin to pay out the initial sum.
-- The same idea is then recursively applied to both sub-problems.

ways :: [Int] -> Int -> Int
ways _ 0 = 1
ways [1] _ = 1
ways coins total = if head coins > total
                   then ways (tail coins) total
                   else (ways coins (total - (head coins))) +
                        (ways (tail coins) total)

main = do
    putStrLn $ show $ ways [200, 100, 50, 20, 10, 5, 2, 1] 200

