#
# (* ****** ****** *)
# //
# // Title:
# // Concepts of
# // Programming Languages
# // Course: CAS CS 320
# //
# // Semester: Spring, 2017
# //
# // Classroom: CAS 325
# // Class Time: TR 12:30-1:45
# //
# // Instructor: Hongwei Xi (hwxiATcsDOTbuDOTedu)
# //
# (* ****** ****** *)
#
######
#
# Assignment 9
#
######
#
# Wormlike: 50 points in total
#
# This Assignment is due Thursday, the 20th of April
#
# ######
#
# Scene 1:
#
# 10 points for a scene that consists of the last digit
# X of your BU ID number and 9-X (drawn with gray dots) and
# 50 prizes (drawn with red dots randomly positioned)
#
# Scene 2:
#
# 10 points for a scene that consists of the first two letters
# of your last name in capital case (drawn with gray dots) and
# 50 prizes (drawn with red dots randomly positioned)
#
# Search:
#
# 30 points for implementing an automatic search for prizes. The
# algorithm for the search should be based on breadth-first graph
# search (using either GraphSearch or GraphStreamize)
#
######

drawing of the board on the page: control.dats
board is a matrix of integers (empty by default)
	can define in param, color # != number for representation

	0 - empty
	1 - worm
	2 - obstacle
	3 - apple
	4 - border
	auxone in draw function does the drawing


moveif - checks if any obstacles
move - takes last element and puts it at the head
movex - adds one element at the head

###### end of [README.txt] ######
