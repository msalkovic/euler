
isPrime :: Integer -> Bool
isPrime x
	| x < 2     = False
	| otherwise = isDiv x 2 (floor (sqrt (fromInteger x)))
    where isDiv m n end
    		| n > end   	 = True
    		| m `mod` n == 0 = False
    		| otherwise 	 = isDiv m (n + 1) end

quadratic a b n = n ^ 2 + n * a + b

numPrimes (a, b) = length (takeWhile isPrime (map (quadratic a b) [0,1..]))

maxIndex xs = let t = (length xs) - 1
			  in maxRec xs t t 
	where maxRec ys c m
		| c < 0     = m
		| otherwise = maxRec ys (c - 1) $! (if ys !! c > ys !! m then c else m)

main = do
	let	factors = [(a, b) | a <- [-999,-997..999], b <- [1,3..999], a + b > 0]
	let mi      = maxIndex (map numPrimes factors)
	--putStrLn (show (length factors))
	putStrLn (show mi)
	putStrLn (show (factors !! mi))
	-- Dobio stack overflow!
	-- 110200; (-61, 971)
