import Data.List

main = do
    let m = 1000000
    let hi = 3 / 7
    let lo = ((3 * (m / 100)) * 99 - 1) / (7 * (m / 100) * 99)
    let pairs = [(round x, round y) |
                    y <- [m - 100..m],
                    x <- [(m - 100) / 3..y - 1],
                    lo < x / y,
                    hi > x / y]
    let reals = map (\(a, b) -> (fromIntegral a) / (fromIntegral b)) pairs
    let sorted = sort $ zip reals pairs
    let result = snd $ last sorted
    putStrLn (show result)

