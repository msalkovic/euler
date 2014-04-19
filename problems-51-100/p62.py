
n = 10000
char_lists = map(lambda x: list(str(x ** 3)), range(n))
for cl in char_lists:
    cl.sort()

for i in range(n):
    same = set()
    same.add(i)
    for j in range(i, n):
        if len(char_lists[j]) > len(char_lists[i]):
            break
        if char_lists[i] == char_lists[j]:
            same.add(j)
        if len(same) == 5:
            print same
            print
            raise StopIteration

