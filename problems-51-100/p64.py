num_digits = lambda x: len(str(x))

total = 0
for n in range(1, 51):
    for m in range(1, 10):
        if num_digits(m ** n) == n:
            print '%d ^ %d = %d' % (m, n, m ** n)
            total += 1

print '\nTotal:', total

