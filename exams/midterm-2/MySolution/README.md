Y_draw (compiles):
	The first part of the aux function draws the V part of the Y, while the second part draws the | of the Y, based on my previous implementation of the A draw from midterm 1

Wallis (compiles):
	The stream aux function constructs the partial sums of the wallis stream with a val psum to track the sum so far, and a i j to calculate the next sum of psum*(i/j). The switch variable alternates which val i or j to increment by 2.

mystream_235 (compiles):
	implementation of the ugly number search is heavily based on the simple implementation described here: http://www.geeksforgeeks.org/ugly-numbers/
	max_divide finds the positive remainder of the largest possible multiple of b divided by a 
	checkUgly checks if a int x is an ugly number based on the fact that after the largest divisors of 2,3 and 5 are divided through the remainder is 1
	findNexUgly finds the next largest number >= x that is ugly 
	mystream_235 calls findNexUgly and stores results in the stream

pangram_check (compiles):
	the function pangram_check basically checks starting from 'a' whether or not it is in the text list. If a character is missing then it automatically returns false, otherwise if it reaches the end of the alphabet it returns true. Loop checks if a letter in the alphabet is in the sentence, and pc_aux iterates through the alphabet.

list2brauntree (compiles):
	the function takes the head of the list of as the central node of its current tree, then divides the tail of the list into two equal parts for the recursive call into subtrees in order to construct the tree as balanced as possible

mytree_postordize (compiles):
	mytree_postordize calls itself recursive down the left, right subtrees first before returning the node value last, ensuring a post-order traversal of the tree. Testing code from https://rosettacode.org/wiki/Tree_traversal#ATS

mystream_remdup (compiles):
	mystream_remdup makes use of the stream_filter_cloref to filter out any repeated elements in the stream after adding it to the returned stream

WordCounting (compiles):
	WordCounting combine step is done in two steps: first loop iterates over every unique word and sums up the total appearances using loop2, which is the loop that calculates the word count and removes the current word's duplicates. This in effect takes about O(n^2) which is why it fails running over the moby dick text, despite passing the initial test.