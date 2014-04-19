"""
2 ** 15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2 ** 1000?
"""

def solve():
    # Brute force, yeah!
    n = 2 ** 1000
    acc = 0
    while n != 0:
        acc += n % 10
        n /= 10
    return acc

def solve_with_output():
    result = solve()
    print result

if __name__ == '__main__':
    solve_with_output()
