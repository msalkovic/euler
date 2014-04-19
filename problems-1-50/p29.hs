import qualified Data.Set as Set

main = do
    let range = [2 .. 100]
    let numbers = [a ^ b | a <- range, b <- range]
    let set = Set.fromList numbers
    putStrLn $ show $ Set.size set


