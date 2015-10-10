package main

import "fmt"

func gcd(a int, b int) int {
	if b == 0 {
		return a
	}
	return gcd(b, a%b)
}

func print_candidates() {
	for den := 11; den < 100; den++ {
		for num := 10; num < den; num++ {
			var units_d, tens_d int = den % 10, den / 10
			var units_n, tens_n int = num % 10, num / 10

			if units_n == tens_d {
				div := gcd(num, den)
				n := num / div
				d := den / div

				// 49/98 == 1/2 will not pass this test:
				if tens_n == n && units_d == d {
					fmt.Printf("%d/%d ---> %d/%d\n", num, den, n, d)
				}
			}
		}
	}
}

func main() {
	print_candidates()

	/*
		  16/64 ---> 1/4
		  26/65 ---> 2/5
		  19/95 ---> 1/5
		  skipped, not printed:
	      49/98 ---> 1/2
	*/
}
