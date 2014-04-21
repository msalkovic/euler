from itertools import cycle
from string import lowercase

def cipher_keys():
    for a in lowercase:
        for b in lowercase:
            for c in lowercase:
                yield a, b, c 

with open('cipher1.txt', 'r') as f:
    line = f.readlines()[0]
    numbers = map(int, line.split(','))

solution = 4423 # Found by examining each combination.

for i, triple in enumerate(cipher_keys()):
    if i == solution:
        decipher = [n ^ ord(char) for n, char in zip(numbers, cycle(triple))]
        text = ''.join(map(chr, decipher))
        print text
        break

print '\n', sum(decipher)

