from itertools import permutations, chain
from pprint import pprint

all_digits = range(1, 11)
num_triples = 5
solutions = []

for p in permutations(all_digits):
    if p[0] == 10 or p[1] == 10 or p[2] == 10:
        continue

    triples = []
    sum_ = -1
    k = -1
    for i in range(num_triples):
        if i == 0:
            k = 3
            triple = list(p[:3])
            sum_ = sum(triple)
            triples.append(triple)
        else:
            triple = [p[k]]
            k += 1
            triple.append(triples[i - 1][-1])

            if i == (num_triples - 1):
                triple.append(triples[0][1])
            else:
                triple.append(p[k])
                k += 1

            if sum(triple) != sum_:
                break
            triples.append(triple)
    
    if len(triples) == num_triples:
        # Append these triples to solutions, but only if 'smaller'
        # triples weren't found before.
        first = triples[0][0]
        for t in triples[1:]:
            if t[0] < first:
                break
        else:
            s = map(str, [t for t in chain(*triples)])
            solutions.append(''.join(s))

print max(map(int, filter(lambda x: len(x) == 16, solutions)))

