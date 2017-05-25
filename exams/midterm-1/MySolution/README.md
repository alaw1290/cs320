Exam 1 

A_draw:
	the drawing of A is split into the top and bottom function, which calls a drawer similar to the one programmed for assignment 2 for triangle draw

mytree_filter:
	using the mytree_fold helper function, the lambda function checks to see if the current node fulfills the test. if it does then it is added to the final list

mytree_minmaxHeight:
	using the mytree_fold helper function, the lambda function checks to see if the current node's left and right branch have any children and which one is longer to determine the min and max height.

mylist_average:
	using three mylist_foldlefts, it first generates a list of the sums, a list of the length of sums, and finally divides them accordingly

mylist_pairing:
	the wrapper function splits the first and last element off into a tuple and the aux function constructs the list of tuples for the result recursively

mylist_altmerge:
	aux_merge uses pattern matching to construct the lists together

mylist_submaxord:
	the divide and conquer function constructs the list of all possible combinations of a certain length, while the aux check and tests seq check to see if any one of the combinations are in increasing order. This is done from the longest possible combination (the length of the sequence) decreasing.