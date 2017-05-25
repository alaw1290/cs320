mystream_235:
	implementation of the ugly number search is heavily based on the simple implementation described here: http://www.geeksforgeeks.org/ugly-numbers/
	max_divide finds the positive remainder of the largest possible multiple of b divided by a 
	checkUgly checks if a int x is an ugly number based on the fact that after the largest divisors of 2,3 and 5 are divided through the remainder is 1
	findNexUgly finds the next largest number >= x that is ugly 
	mystream_235 calls findNexUgly and stores results in the stream