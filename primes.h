#ifndef PRIMES_H
#define PRIMES_H

#include <stdio.h>
#include <string.h>

// Slightly modified Sieve of Erathostenes: if n is prime,
// array[n] will be 0; if n is composite, array[n] will hold
// n's largest prime factor.
// Exceptions are 0 and 1, where array[0] == array[1] == 1;
void sieve(int* array, int range) {
	int i, next;
	int n = 2;
	
	memset(array, 0, range * sizeof(int));

	array[0] = 1;
	array[1] = 1;
	
	while (1) {
		for (i = n + n; i < range; i += n) array[i] = n;

		next = -1;
		for (i = n + 1; i < range; i++) if (array[i] == 0) {
			next = i;
			break;
		}

		if (next == -1) break;
		n = next;
	}
}

void prime_factors(int* primes, int* factors, int number) {
	int i = 0;
	int p;

	while (1) {
		p = primes[number];
		if (p) {
			// number is composite
			factors[i++] = p;
			number /= p;
		} else {
			// number is prime
			factors[i] = number;
			return;
		}
	}
}

void unique_factors(int* primes, int* factors, int number) {
	int i = 0;
	int p;
	
	while (1) {
		p = primes[number];
		if (p) {
			// number is composite
			if (i == 0 || factors[i - 1] != p) factors[i++] = p;
			number /= p;
		} else {
			// number is prime
			if (i == 0 || factors[i - 1] != number) factors[i] = number;
			return;
		}
	}
}

#endif // PRIMES_H

