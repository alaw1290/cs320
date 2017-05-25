//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Spring 2017
// Class Time: TR 12:30-2:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Hanwen (Steinway) Wu (hwwuATbuDOTedu)
//
(* ****** ****** *)
//
// Midterm 1
//
(* ****** ****** *)
//
// Out: 9:00 on the 2nd of March, 2017
// Due: 11:59pm on the 2nd of March, 2017
//
(* ****** ****** *)
//
// ATTENTION:
// Absolutely no collaboration in any form is allowed!!!
//
(* ****** ****** *)

(*
//
NOTE: 75 points = 100%
//
A_draw: 10 points
mytree_filter: 10 points
mylist_average: 10/20 pts
mylist_pairing: 10 points
mylist_altmerge: 10 points
mylist_submaxord: 20 points
mytree_minmaxHeight: 10 points
mylist_permute_succ: 20 pts
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./mylib/mylist.dats"
staload "./mylib/mytree.dats"

(* ****** ****** *)

(*
//
// HX: 10 points
// The function A_draw is called to draw the letter 'A':

A_draw(1):

  *
 ***
*   *

A_draw(2):

    *
   * *
  *****
 *     * 
*       *

You may assume that A_draw can only be called on positive
integers.
*)

extern
fun
A_draw(n: int): void

(* ****** ****** *)
//
// HX: 10 points
//
// Given a binary tree and a predicate,
// [mytree_filter] returns a list consisting of
// all the elements in the tree that satisfiyes
// the predicate.
//
extern
fun{a:t@ype}
mytree_filter(tree0(a), p: (a) -> bool): list0(a)
//
(* ****** ****** *)
  
(*
//
HX: 10 points
//
HX: 20 points if done solely based on combinators
HX: Please study mylist_foldleft and mylist_ifoldleft
    in mylib/mylist
//
Given a list of numbers:

x1, x2, ..., xn

the function [list0_average] returns another list of numbers

y1, y2, ..., yn

`such that

y1 = x1, y2 = (x1+x2)/2, ..., yn = (x1+x2+...+xn)/n

For instance,

(1.0, 2.0, 3.0) is transformed into (1.0, 1.5, 2.0)
//
*)
extern
fun
mylist_average
  (xs: list0 (double)): list0 (double)
//
(* ****** ****** *)
//
// HX: 10 points
//
// Given a list xs = (x_1, x_2, ..., x_{n-1}, x_n),
// [mylist_pairing] returns ((x_1, x_n), (x_2, x_{n-1}), ...)
//
// Say xs = (1, 2, 3, 4, 5, 6). Then the result equals
// ((1, 6), (2, 5), (3, 4).
//
// You may assume that [xs] is always a list containing an even
// number of elements.
//
extern
fun{a:t@ype}
mylist_pairing(xs: list0(a)): list0(@(a, a))
//
(* ****** ****** *)
//
// HX: 10 points
//
// The function [mylist_altmerge] merges two given
// lists into one alternately.
//
// Say xs = (1, 2, 3) and ys = (4, 5, 6, 7, 8)
// Then the result should be (1, 4, 2, 5, 3, 6, 7, 8)
//
// Say xs = (4, 5, 6, 7, 8) and ys = (1, 2, 3)
// Then the result should be (4, 1, 5, 2, 6, 3, 7, 8)
//
extern
fun{a:t@ype}
mylist_altmerge
  (xs: list0(a), ys: list0(a)): list0(a)
//
(* ****** ****** *)
//
// HX: 20 points
//
// Given a list xs of integers, the function
// [mylist_submaxord] returns the longest leftmost
// subsequence of xs that is ordered.
//
// If xs = (1, 3, 2, 4), then the result is (1, 3, 4)
//
// If xs = (4, 1, 2, 3, 8, 9, 5, 6, 7), then the result
// is (1, 2, 3, 5, 6, 7)
//
extern
fun
mylist_submaxord(xs: list0(int)): list0(int)
//
(* ****** ****** *)

(*
//
// 10 points
//
** The height of a tree is the length of the longest path from
** the root of the tree to a leaf note. Let us call this "maxHeight".
** There is a related concept "minHeight", which refers the length of
** the *shortest* path from the root to a leaf node.

** Please implement a function for computing maxHeight and minHeight
** of a given binary tree by making exactly *one* call to mytree_fold.
**
** In particular, a solution receiving full credit *cannot* make use of
** pattern matching explicitly.
**
*)
extern
fun{a:t@ype}
mytree_minmaxHeight (t0: tree0 (a)): (int, int)

(* ****** ****** *)
//
(*
//
// 20 points
//
// The permutations of 0,1,2 can be ordered
// according to the lexicographic ordering as follows:
//
// (0,1,2) < (0,2,1) < (1,0,2) < (1,2,0) < (2,0,1) < (2,1,0)
//
// This ordering can be readily generalized to the permuations
// of n numbers, which n is positive. Given a permutation xs of
// the first n natural numbers, mylist_permutation_succ(xs) returns
// the next permutation following xs if it exists or it returns None()
// to indicate that such a permutation does not exist.
//
// Please implement [mylist_permutation_succ].
//
*)
//
extern
fun
mylist_permute_succ(xs: list0(int)): Option(list0(int))
//
(* ****** ****** *)

(* end of [midterm-1.dats] *)
