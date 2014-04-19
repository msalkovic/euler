import Data.Char
import Data.List
import Debug.Trace

convertLine :: String -> [Int]
convertLine str = let xs = [if x == ',' then ' ' else x | x <- str]
                  in map read (words xs)

getTriangles :: String -> [[Int]]
getTriangles str = map convertLine (lines str)

sign :: Int -> Int
sign 0 = 0
sign x = if x > 0 then 1 else -1

checkSide :: [Int] -> Int
--checkSide xs | trace (show xs) False = undefined
checkSide xs = let x1 = head xs
                   y1 = xs !! 1
                   x2 = xs !! 2
                   y2 = xs !! 3
                   x3 = xs !! 4
                   y3 = last xs
                   prod = ((y1 - y2) * (x3 - x1) + (x2 - x1) * (y3 - y1))
               in sign prod

containsOrigin :: [Int] -> Bool
containsOrigin ps = let s1 = checkSide ((take 4 ps) ++ [0, 0])
                        s2 = checkSide ((take 2 ps) ++ [0, 0] ++ (drop 4 ps))
                        s3 = checkSide ([0, 0] ++ (drop 2 ps))
                    in s1 == s2 && s2 == s3

main = do
    content <- readFile "triangles.txt"
    let ts = getTriangles content
    let ts' = filter containsOrigin ts
    --putStrLn (show ts')
    --putStrLn "\n"
    --putStrLn (show ts')
    putStrLn (show (length ts'))

