import Data.List

num :: [Int] -> Int
num [x] = x
num xs = last xs + 10 * (num $ init xs)

is_solution :: [Int] -> Bool
is_solution xs = xs !! 3 `mod` 2 == 0 &&
                 (num $ drop 2 $ take 5 xs) `mod` 3 == 0 &&
                 (num $ drop 3 $ take 6 xs) `mod` 5 == 0 &&
                 (num $ drop 4 $ take 7 xs) `mod` 7 == 0 &&
                 (num $ drop 5 $ take 8 xs) `mod` 11 == 0 &&
                 (num $ drop 6 $ take 9 xs) `mod` 13 == 0 &&
                 (num $ drop 7 xs) `mod` 17 == 0

main = do
  let pandigitals = filter (\x -> head x /= 0) $ permutations [0..9]
  let solutions = filter is_solution pandigitals
  let result = sum $ map num solutions
  putStrLn $ show result

