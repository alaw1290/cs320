(* ****** ****** *)
//
// Title:
// Concepts of
// Programming Languages
// Course: CAS CS 320
//
// Semester: Spring, 2017
//
// Classroom: CAS 325
// Class Time: TR 12:30-1:45
//
// Instructor: Hongwei Xi (hwxiATcsDOTbuDOTedu)
//
(* ****** ****** *)
//
// Due date: Monday, the 6th of February
//
(* ****** ****** *)

#define
ATS_PACKNAME "ASSIGN02"

(* ****** ****** *)
//
// HX: Total = 30 points
//
(* ****** ****** *)

(*
//
HX: 10 points
//
Please implement [show_triangle] that takes
a positive integer n and prints out a triangular shape
of height n.
//
As an example, show_triangle(3) prints out the following shape:
  *
 ***
*****
As another example, show_triangle(5) prints out the following shape:
    *
   ***
  *****
 *******
*********
//
*)

(* ****** ****** *)
//
extern
fun
show_triangle(n: int): void
//
(* ****** ****** *)

(*
//
HX: 10 points
//
Assume that the last digit of your BU identification number is
x. Please implement two of the following functions for printing digit
x and digit 9-x:
//
*)
//
extern
fun print_digit_0(): void // printing digit 0
and print_digit_1(): void // printing digit 1
and print_digit_2(): void // printing digit 2
and print_digit_3(): void // printing digit 3
and print_digit_4(): void // printing digit 4
and print_digit_5(): void // printing digit 5
and print_digit_6(): void // printing digit 6
and print_digit_7(): void // printing digit 7
and print_digit_8(): void // printing digit 8
and print_digit_9(): void // printing digit 9
//
(* 
//
You may assume that the height of the printed image of a digit is 9
characters and the width is the same. For instance, please see some
digits by visiting the following page of a digital clock for reporting
the current time:
//
http://ats-lang.sourceforge.net/COMPILED/doc/PROJECT/SMALL/JSclock/myclock2.html
//
*)

(* ****** ****** *)

(*
//
HX: 10 points
//
Recurrence equations commonly occur in the study of time-complexity of
algorithms. For instance, in a two-way mergesort, the following equations
define the complexity of mergesort:
//
MS(0) = 1
MS(1) = 1
MS(n) = 2 * MS(n/2) + n if n >= 2
//
Please give an implementation of MS by following the example in solve-one-recur:
//
*)

extern fun MS(n: int): int

(* ****** ****** *)

(* end of [assign02.dats] *)
