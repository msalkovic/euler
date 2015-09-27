#include <stdio.h>
#include <string.h>
#include <math.h>

#define LIMIT 1500001

// Lazy man's dictionary. Index in the array represents the
// sum of one Pythagorean triple; the value at that index shows
// how many times this sum has occured.
int g_map[LIMIT];

void count_triples(int a, int b, int c) {
	int s = a + b + c;
	int k = 1;

	if (s > LIMIT) return;

	while(1) {
		++g_map[k * s];
		++k;
		if (k * s > LIMIT) break;
	}

	count_triples( a - 2 * b + 2 * c,  2 * a - b + 2 * c,  2 * a - 2 * b + 3 * c);
	count_triples( a + 2 * b + 2 * c,  2 * a + b + 2 * c,  2 * a + 2 * b + 3 * c);
	count_triples(-a + 2 * b + 2 * c, -2 * a + b + 2 * c, -2 * a + 2 * b + 3 * c);
	return;
}

int main(int argc, char** argv) {
	// Initialize the entire map to zero.
	memset(g_map, 0, LIMIT * sizeof(int));

	count_triples(3, 4, 5);

	int c = 0;
	for (int i = 0; i < LIMIT; ++i) {
		if (g_map[i] == 1) ++c;
	}

	printf("\nsolution: %d", c);
	return 0;
}

