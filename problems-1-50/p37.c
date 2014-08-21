#include <stdio.h>
#include <math.h>
#include "../primes.h"

#define PRIMES 1000000

int primes[PRIMES];

int is_truncatable_right(int n) {
	if (n < 10) {
		return primes[n] == 0;
	}

	return primes[n] == 0 && is_truncatable_right(n / 10);
}

int is_truncatable_left(int n) {
	if (n < 10) {
		return primes[n] == 0;
	}

	int digits = (int)ceil(log10((double)n));

	return primes[n] == 0 && is_truncatable_left(n % (int)pow(10, digits - 1));
}

int main() {
	sieve(primes, PRIMES);

	int i, sum = 0;

	for (i = 10; i < PRIMES; ++i) {
		if (is_truncatable_right(i) && is_truncatable_left(i)) {
			sum += i;
		}
	}

	printf("%d\n", sum);
	return 0;
}

