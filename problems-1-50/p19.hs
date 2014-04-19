
day (d, _, _) = d
month (_, m, _) = m
year (_, _, y) = y

leap :: Int -> Bool
leap year
    | mod year 400 == 0 = True
    | mod year 100 == 0 = False
    | mod year 4 == 0   = True
    | otherwise         = False

daysInMonth :: Int -> Int -> Int
daysInMonth m y
    | m == 2               = feb
    | elem m [4, 6, 9, 11] = 30
    | otherwise            = 31
    where feb
            | leap y    = 29
            | otherwise = 28

--countDays :: (Int, Int, Int) -> Int -> Int -> Int
countDays date from to
    | year date > to   = 0
    | year date < from = countDays next from to
    | otherwise        = (countDays next from to) + (if day date == 1 then 1 else 0)
    where next =
            let
                days = daysInMonth (month date) (year date)
                overflow = ((day date) + 7) `div` days == 1
                d = ((day date) + 7) `mod` days
                m = if overflow
                    then ((month date) + 1) `mod` 12
                    else month date
                y = if overflow && ((month date) + 1) `div` 12 == 1
                    then (year date) + 1
                    else year date
            in
                (d, m, y)

main = do putStrLn (show (countDays (7, 1, 1900) 1901 2000))

