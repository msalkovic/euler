def cycle_len(den):
    num = 10
    nums = []
    while True:
        if num in nums:
            return len(nums) - nums.index(num)
        nums.append(num)
        num = 10 * (num - ((num / den) * den))

print max(zip(map(cycle_len, range(1, 1000)), range(1, 1000)))[1]

