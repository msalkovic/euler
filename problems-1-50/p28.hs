import Data.List

diag :: Integer -> [Integer]
diag 1 = [1]
diag n = let m = n ^ 2
             s = n - 1
         in [m, m - s, m - 2 * s, m - 3 * s]

isPrime :: Integer -> Bool
isPrime x
    | x < 2     = False
    | otherwise = isDiv x 2 (floor (sqrt (fromInteger x)))
    where isDiv m n end
            | n > end        = True
            | m `mod` n == 0 = False
            | otherwise      = isDiv m (n + 1) end

ratioOnDiag :: Integer -> (Int, Int)
ratioOnDiag 1 = (0, 1)
ratioOnDiag n = (length (filter isPrime (diag n)), 4)

ratioSumAcc acc x = let t = ((fst acc + fst x), (snd acc + snd x))
                    in (t, (fromIntegral (fst t)) / (fromIntegral (snd t)))

-- problem 58:
main = do 
    let ratios = map ratioOnDiag [1,3..26241]
    let ((primes, all_), ratio) = mapAccumL ratioSumAcc (0, 0) ratios
    --let tooBig = takeWhile (>0.1) (tail ratio)
    putStrLn (show (last ratio))
-- result: 26241

-- problem 28:
--main = do 
--    let nums = [1,3..1001]
--    let res = sum (map sum (map diag nums))
--    putStrLn (show res)

-- result: 669171001

