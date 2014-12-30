def get_diagonal_indices(mat_size):
    di = []
    for i in range(mat_size):
        di.append(zip(range(i, -1, -1), range(0, i + 1)))
    for i in range(mat_size - 1):
        di.append(zip(range(mat_size - 1, i, -1), range(i + 1, mat_size)))
    return di

MAX = 1000000
matrix = []

with open("matrix81.txt") as f:
    for line in f:
        numbers = map(int, line.split(','))
        matrix.append(numbers)

for di in get_diagonal_indices(len(matrix))[1:]:
    for i, j in di:
        top = MAX if i == 0 else matrix[i - 1][j]
        left = MAX if j == 0 else matrix[i][j - 1]
        matrix[i][j] += min(top, left)

print matrix[-1][-1]

