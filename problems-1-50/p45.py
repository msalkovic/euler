r = range(1, 100000)

T = map(lambda n: n * (n + 1) / 2,     r)
P = map(lambda n: n * (3 * n - 1) / 2, r)
H = map(lambda n: n * (2 * n - 1),     r)

print max(set(T) & set(P) & set(H))

