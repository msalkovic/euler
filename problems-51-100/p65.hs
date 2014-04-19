
frac _ 0 = error "Denominator cannot be zero!"
frac n d = (n, d)

num (n, _) = n
den (_, d) = n
