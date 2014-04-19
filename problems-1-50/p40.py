d = ''.join(map(str, range(200000)))
r = [d[1], d[10], d[100], d[1000], d[10000], d[100000], d[1000000]]

print reduce(lambda x, y: x * y, map(int, r)) 

