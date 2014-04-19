"""
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out
in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 
(three hundred and forty-two) contains 23 letters and 115 
(one hundred and fifteen) contains 20 letters. The use of "and" when writing
out numbers is in compliance with British usage.
"""

_num_to_word = \
{
1: 'one',           2: 'two',           3: 'three',         4: 'four',
5: 'five',          6: 'six',           7: 'seven',         8: 'eight',
9: 'nine',          10: 'ten',          11: 'eleven',       12: 'twelve',
13: 'thirteen',     14: 'fourteen',     15: 'fifteen',      16: 'sixteen',
17: 'seventeen',    18: 'eighteen',     19: 'nineteen',     20: 'twenty',
30: 'thirty',       40: 'forty',        50: 'fifty',        60: 'sixty',
70: 'seventy',      80: 'eighty',       90: 'ninety',       0: ''
}


def spell_number(n):
    # Limited to 999. No spaces in output string, as spaces don't count.
    if n in _num_to_word:
        return _num_to_word[n]
    if n < 100:
        return '%s%s' % (_num_to_word[(n / 10) * 10], _num_to_word[n % 10])
    if n % 100 == 0:
        return '%shundred' % _num_to_word[n / 100]
    return '%shundredand%s' % (_num_to_word[n / 100], spell_number(n % 100))

def solve():
    strings = map(spell_number, range(1, 1000))
    return sum(map(len, strings)) + len('onethousand')

if __name__ == '__main__':
    print solve()

