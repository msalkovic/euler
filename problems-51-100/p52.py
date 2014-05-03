def digits(x):
    return map(int, str(x))

def quick_check(x):
    # Check if sum of digits is the same for 2x, 3x, etc.
    xs = map(lambda n: sum(digits(n * x)), range(2, 7))
    return xs[0] == xs[1] == xs[2] == xs[3] == xs[4]

def real_check(x):
    xs = map(lambda n: sorted(digits(n * x)), range(2, 7))
    return xs[0] == xs[1] == xs[2] == xs[3] == xs[4]

def find_solution():
    lo = 50
    hi = 170
    while True:
        for i in range(lo, hi):
            if quick_check(i) and real_check(i):
                print i #2*i, 3*i, 4*i, 5*i, 6*i
                return
        lo *= 10
        hi *= 10

find_solution()

