
def fib_gen():
    yield 1, 1, 1
    i = 0
    j = 1
    c = 1

    while True:
        c += 1
        x = (i + j) % 1000000000
        y = i + j
        yield c, x, y
        i = j
        j = y

def pandigital(num_str):
    return len(set(num_str)) == 9 and '0' not in num_str

if __name__ == '__main__':
    fibs = fib_gen()

    while True:
        c, x, y = fibs.next()
        if pandigital(str(x)) and pandigital(str(y)[:9]):
            print c
            break

