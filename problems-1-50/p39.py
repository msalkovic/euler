from collections import defaultdict
from math import sqrt

pmax = 1000
pcount = defaultdict(int)
hypot = set()

for m in xrange(1, int(round(sqrt(pmax)))):
    for n in xrange(1, m):
        k = 1
        while True:
            a = k * (m ** 2 - n ** 2)
            b = k * 2 * m * n
            c = k * (m ** 2 + n ** 2)
            p = a + b + c

            if p <= pmax:
                k += 1
                if c not in hypot:
                    hypot.add(c)
                    pcount[p] += 1
            else:
                break

print max(zip(pcount.values(), pcount.keys()))[1]

