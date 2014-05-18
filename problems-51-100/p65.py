frac = lambda n, d: (n, d)
num  = lambda x: x[0]
den  = lambda x: x[1]
invert  = lambda x: frac(den(x), num(x))
add_int = lambda i, x: frac(num(x) + i * den(x), den(x))

def nth_expansion(seq):
    if len(seq) == 0:
        return frac(0, 1)
    if len(seq) == 1:
        return frac(seq[0], 1)

    x = frac(seq[-1], 1)
    k = len(seq) - 2
    while k >= 0:
        x = add_int(seq[k], invert(x))
        k -= 1
    return x

# Generate first 100 convergents for e.
e_seq = [2]
for i in range(1, 34):
    e_seq.extend([1, 2 * i, 1])

print sum(map(int, str(num(nth_expansion(e_seq)))))

