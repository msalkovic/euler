solution :: Integer -> Bool
solution x = d !! 0 == '1' &&
             d !! 2 == '2' &&
             d !! 4 == '3' &&
             d !! 6 == '4' &&
             d !! 8 == '5' &&
             d !! 10 == '6' &&
             d !! 12 == '7' &&
             d !! 14 == '8' &&
             d !! 16 == '9' &&
             d !! 18 == '0'
        where d = show (x ^ 2)

main = do
    let s = 1350000000
    let e = 1400000000
    let xs = filter solution [s, s+10 .. e]
    putStrLn (show (head xs))
    -- solution: 1389019170

