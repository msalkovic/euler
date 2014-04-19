from math import sqrt

def is_pentagonal(x):
    n = (sqrt(24 * x + 1) + 1) / 6
    return (n - int(n)) < 1e-10

_pen = lambda n: n * (3 * n - 1) / 2

def solve():
    n = 2
    while True:
        p = _pen(n)
        for i in range(1, n):
            r = _pen(i)
            if is_pentagonal(p - r) and is_pentagonal(p + r):
                return p, r, p - r
        n += 1

if __name__ == '__main__':
    print solve()
