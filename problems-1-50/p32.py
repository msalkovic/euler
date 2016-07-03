pan = set(range(1, 10))

def digits(x):
    t = x
    ds = []
    # Won't work for x = 0 but that's irrelevant.
    while t != 0:
        ds.append(t % 10)
        t /= 10
    return ds

def is_combo_pandigital(a, b, c):
    da = digits(a)
    db = digits(b)
    dc = digits(c)
    return (len(da) + len(db) + len(dc) == 9) and\
           (set(da) | set(db) | set(dc) == pan) 


if __name__ == '__main__':
    solutions = set()

    # Shorter but less readable:
    # for i in range(1, 10):
    #     ndi = len(digits(i))
    #     for j in range(10 ** (4 - ndi), 10 ** (4 - ndi + 1):
    #         ...

    for i in range(1, 10):
        for j in range(1000, 10000):
            if is_combo_pandigital(i, j, i * j):
                print i, j, i * j
                solutions.add(i * j)

    for i in range(10, 100):
        for j in range(100, 1000):
            if is_combo_pandigital(i, j, i * j):
                print i, j, i * j
                solutions.add(i * j)

    print '\nSolution:', sum(solutions)

