#include <stdio.h>
#include "../primes.h"

#define PRIMES 130000
#define FACTORS 20

int primes[PRIMES];

int is_abc_hit(int a, int b, int c) {
	int fsa[3 * FACTORS], fsb[FACTORS], fsc[FACTORS];
	int i, j;
	unsigned long int prod;

	if (a >= b || a + b != c) return 0;

	memset(fsa, 0, FACTORS * sizeof(int) * 3);
	memset(fsb, 0, FACTORS * sizeof(int));
	memset(fsc, 0, FACTORS * sizeof(int));
	unique_factors(primes, fsa, a);
	unique_factors(primes, fsb, b);
	unique_factors(primes, fsc, c);

	i = 0;
	while (fsb[i] != 0) {
		j = 0;
		// a and b must not have common factors for abc hit
		while (fsa[j] != 0) if (fsa[j++] == fsb[i]) return 0;
		fsa[j] = fsb[i];
		++i;
	}
	
	i = 0;
	while (fsc[i] != 0) {
		j = 0;
		// a, b and c must not have common factors for abc hit
		while (fsa[j] != 0) if (fsa[j++] == fsc[i]) return 0;
		fsa[j] = fsc[i];
		++i;
	}

	i = 0;
	prod = 1;
	while (fsa[i] != 0) prod *= fsa[i++];
	if (prod >= c) return 0;

	return 1;
}

int main() {
	sieve(primes, PRIMES);

	int maxc = 120001;
	unsigned long int sumc = 0;
	unsigned long int total = 0;
	int i, j, step;

	for (i = 1; i < maxc; i++) {
		step = i % 2 == 0 ? 2 : 1;
		for (j = i + 1; j <= maxc - i; j += step) {
			if (is_abc_hit(i, j, i + j)) {
				sumc += (i + j);
				total++;
			}
		}
	}

	printf("SUM: %lu TOTAL: %lu\n\n", sumc, total);

	return 0;
}
