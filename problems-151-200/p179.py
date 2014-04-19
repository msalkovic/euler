
from collections import defaultdict
from time import time

def sieve(up_to):
    nums = range(2, up_to)
    i, p = 0, 2
    while i + p < len(nums):
        for k in xrange(i + p, len(nums), p):
            nums[k] = 0
        while True:
            i += 1
            p = nums[i]
            if p != 0:
                break
    return filter(lambda x: x > 0, nums)

primes = sieve(10 ** 5)

def num_divisors(x):
    if x in primes:
        return 2
    divs = defaultdict(int)
    i, p = 0, 2
    while True:
        while x % p == 0:
            divs[p] += 1
            x /= p
        if p > x:
            break
        i += 1
        p = primes[i]
    return reduce(lambda x, y: x * y, [k + 1 for k in divs.values()])

def solve():
    count = 0
    i, j = 2, 3
    di = num_divisors(i)
    while j <= 10**5:
        dj = num_divisors(j)
        if di == dj:
            count += 1
            assert i % 10 != 0 or j % 10 != 0, "%d %d %d %d" % (i, j, di, dj)
        di = dj
        i, j = j, j + 1
    return count    

if __name__ == '__main__':
    t = time()
    print solve()
    print
    print time() - t
