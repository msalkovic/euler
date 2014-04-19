def outcomes(dice, sides):
    if dice == 1:
        return map(lambda x: [x], range(1, sides + 1))

    result = []
    for i in range(1, sides + 1):
        out = outcomes(dice - 1, sides)
        for list_ in out:
            list_.append(i)
        result.extend(out)
    return result

total_peter = 4 ** 9
total_colin = 6 ** 6

sums_p = map(sum, outcomes(9, 4))
prob_p = {}
for s in sums_p:
    if s in prob_p:
        prob_p[s] += 1
    else:
        prob_p[s] = 1

sums_c = map(sum, outcomes(6, 6))
prob_c = {}
for s in sums_c:
    if s in prob_c:
        prob_c[s] += 1
    else:
        prob_c[s] = 1

# List all outcomes where Peter beats Colin.
solution = 0
for k1, v1 in prob_p.items():
    print "%d %d >" % (k1, v1),
    peter = float(v1) / float(total_peter)
    colin = 0

    for k2, v2 in prob_c.items():
        if k2 < k1:
            print "(%d, %d)" % (k2, v2),
            colin += v2
   
    colin = float(colin) / float(total_colin)    
    print "\n", peter, colin, "\n"
    solution += (peter * colin)

print "\n", solution, "\n"

