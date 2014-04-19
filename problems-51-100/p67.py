"""
By starting at the top of the triangle below and moving to adjacent numbers
on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle67.txt.
"""

def solve():
    with open('triangle67.txt', 'r') as f:
        lines = [map(int, line.split()) for line in f]

    prev = lines[0]
    for i in range(1, len(lines)):
        curr = lines[i]
        curr[0] += prev[0]
        curr[-1] += prev[-1]
        for j in range(1, len(curr) - 1):
            curr[j] += max(prev[j - 1], prev[j])
        prev = curr
    return max(curr)

if __name__ == '__main__':
    print solve()
