# TODO: move sieve to some common module
def sieve(up_to):
    array = [0] * up_to
    n = 2

    while True:
        for i in xrange(n + n, up_to, n):
            array[i] = n

        next_ = -1
        for i in xrange(n + 1, up_to):
            if array[i] == 0:
                next_ = i
                break
        else:
            return array
        n = next_

def primes(up_to):
    s = sieve(up_to)
    return [i for i in range(len(s)) if i > 1 and s[i] == 0]

def digits(x):
    return sorted(map(int, str(x)))

def find_solutions():
    ps = filter(lambda x: x > 1000, primes(10000))

    for i in xrange(len(ps)):
        for j in xrange(i + 1, len(ps)):
            a = ps[i]
            b = ps[j]
            c = b + (b - a)

            if c > 10000:
                break

            if c in ps and (digits(a) == digits(b) == digits(c)):
                print a, b, c

find_solutions()

