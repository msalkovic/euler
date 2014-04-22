from math import sqrt, floor

# brute force search for divisors
def proper_divisors(n):
    divs = []
    i = 2
    s = sqrt(n)
    while i < s:
        if n % i == 0:
            divs.append(i)
            divs.append(n / i)
        i += 1
    if i == floor(s):
        divs.append(i)
    if n < 2: # hackish
        return [-1]
    return [1] + divs

if __name__ == '__main__':
    d = map(sum, map(proper_divisors, xrange(10000)))
    total = 0
    for i in xrange(len(d)):
        try:
            if i == d[d[i]] and i != d[i]:
                total += i
                print i, d[i]
        except IndexError:
            pass
    print total
