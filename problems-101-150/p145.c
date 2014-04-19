#include<stdio.h>

long reverse(long n) {
	long x = n;
	long y = 0;

	while (x) {
		y *= 10;
		y += (x % 10);
		x /= 10;
	}

	return y;
}

int reversible(long n) {
	long m = reverse(n);
	long sum = m + n;
	int rev = 1;

	while (sum) {
		if ((sum % 10) % 2 == 0) {
			rev = 0;
			break;
		}
		sum /= 10;
	}

	return rev;
}

int main() {
	long i, total = 0;

	for (i = 0; i < 1000000000; i++) {
		if ((i % 10) && reversible(i)) total++;
	}
	
	printf("Done! \n%ld\n\n", total);
	return 0;
}

