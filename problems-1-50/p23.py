from math import ceil, sqrt

def divisors(n):
    divs = [1]
    for i in range(2, 1 + int(round(sqrt(n)))):
        if n % i == 0:
            divs.append(i)
            if i != n / i:
                divs.append(n / i)
    return divs

def abundant(up_to):
    is_abundant = lambda n: sum(divisors(n)) > n
    return filter(is_abundant, range(1, up_to))

def possible_abundant_sums(abns, max_i):
    sums = set([24]) # 24 = first sum of two abundant numbers
    for i in range(1, max_i):
        sums.update({abns[j] + abns[i] for j in xrange(i + 1) if abns[j] + abns[i] < 28124})
    return sums

abns = abundant(28124)
sums = possible_abundant_sums(abns, len(abns))
print sum(set(range(28124)) - sums)

