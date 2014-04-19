#include <stdio.h>
#include <math.h>
#include "../primes.h"

#define PRIMES 1000000
int primes[PRIMES];

int main() {
	sieve(primes, PRIMES);

	int i, j, n, d, digits, prime;
	int count = 0;

	for (i = 2; i < PRIMES; i++) {
		if (!primes[i]) {
			n = i;
			digits = (int)ceil(log10((double)n));
			prime = 1;

			for (j = 0; j < digits; j++) {
				d = n % 10;
				n /= 10;
				n += d * (int)pow(10.0, digits - 1);

				if (primes[n]) {
					prime = 0;
					break;
				}
			}

			if (prime) ++count;
		}
	}

	printf("%d\n", count);
	return 0;
}

