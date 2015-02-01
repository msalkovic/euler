#include <stdio.h>
#include "../primes.h"

#define HAMMING_TYPE 100
#define RANGE 1000000000

int primes[RANGE];

int is_hamming_num(int htype, int n) {
	/* If number is prime, it has to be less-or-equal-to htype;
	   otherwise its biggest prime factor has to be <= htype.
	*/
	return primes[n] ? primes[n] <= htype : n <= htype;
}

int main() {
	int result = 0;
	sieve(primes, RANGE);

	for(int i = 0; i <= RANGE; i++) if (is_hamming_num(HAMMING_TYPE, i)) ++result;

	printf("%d\n", result);
	return 0;
}

