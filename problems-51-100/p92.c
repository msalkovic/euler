#include <stdio.h>

#define MAX 10000000

int sum_digits_sq(unsigned long n) {
	int r, sum = 0;

	while (n) {
		r = n % 10;
		sum += r * r;
		n /= 10;
	}

	return sum;
}

int main() {
	unsigned long i, n, sol = 0;

	for (i = 1; i < MAX; ++i) {
		n = sum_digits_sq(i);
		while (n != 1 && n != 89) n = sum_digits_sq(n);
		if (n == 89) ++sol;
	}

	printf("%lu\n\n", sol);

	return 0;
}

