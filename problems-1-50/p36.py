def digits(n):
    return map(int, str(n))

def palindrome(ns):
    return ns == ns[::-1]

def dbp(n): # double-base palindrome
    return palindrome(digits(n)) and palindrome("{0:b}".format(n))

print sum(filter(dbp, range(1000000)))

