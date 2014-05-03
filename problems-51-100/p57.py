frac = lambda n, d: (n, d)
num  = lambda x: x[0]
den  = lambda x: x[1]
invert  = lambda x: frac(den(x), num(x))
add_int = lambda i, x: frac(num(x) + i * den(x), den(x))
check   = lambda x: len(str(num(x))) > len(str(den(x)))

def nth_expansion(n):
	x = frac(5, 2)
	for i in range(n - 1, 0, -1):
		k = 1 if i == 1 else 2
		x = add_int(k, invert(x))
	return x

print len(filter(check, map(nth_expansion, range(8, 1001))))

