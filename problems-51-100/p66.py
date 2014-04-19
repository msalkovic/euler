
squares = [i ** 2 for i in range(1, 32)]
numbers = [i for i in range(2, 1001) if i not in squares]
solutions = []

with open('pell-solutions.txt') as f:
    for d, line in zip(numbers, list(f)[1:len(numbers) + 1]):
        solutions.append((int(line.split()[-1]), d))

print max(solutions)

