"""
What is the first term in the Fibonacci sequence to contain 1000 digits?
"""

def solve():
    k1 = k2 = 1
    term = 2
    while len(str(k2)) < 1000:
        term += 1
        k1, k2 = k2, k1 + k2
    return term

if __name__ == '__main__':
    print solve()
