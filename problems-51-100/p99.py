from math import log10

with open('base_exp.txt') as f:
    base_exp = [map(int, line.split(',')) for line in f]
    xs = [exp * log10(base) for base, exp in base_exp]
    print max(zip(xs, range(1, len(xs) + 1)))[1]

