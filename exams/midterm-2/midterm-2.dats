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
// Midterm 2
//
(* ****** ****** *)
//
// Out: 9:00 on Tuesday, the 18th of April, 2017
// Due: 11:59pm on Wednesday, the 19th of April, 2017
//
(* ****** ****** *)
//
// ATTENTION:
// Absolutely no collaboration in any form is allowed!!!
//
(* ****** ****** *)

(*
//
NOTE:
80 points = 100%
//
// First group:
//
Y_draw: 10 points x
Wallis: 10 points x
mystream_235: 10 points x
pangram_check: 10 points x
list2brauntree: 10 points x
mytree_postordize: 10 points x
mylist_select: 10 points
mystream_group: 10 points ...
mystream_remdup: 10 points x
//
// Second group:
//
DC_permute: 20 points
WordCounting: 20 points x
//
// You can earn up to 60 points from the
// first group and 40 points from the second
// group.
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
// HX: 10 points
// [Y_draw] takes a positive integer n and
// prints out a Y-shape diagram according to
// the value of n. For n = 1, 2, 3, the diagrams
// are given as follows:
//
(*
n = 1:

* *
 *
 *

n = 2:

*   *
 * *
  *
  *
  *

n = 3:

*     *
 *   *
  * *
   *
   *
   *
   *
*)
extern
fun
Y_draw(n: int): void
//
(* ****** ****** *)
(*
**
** HX: 10 points
**
*)
(*
You can find Wallis product here:
http://en.wikipedia.org/wiki/Wallis_product
Please implement a function that generates a stream
consisting of all the partial products in Wallis product:
*)
//
extern
fun Wallis((*void*)): stream(double)
//
(* ****** ****** *)
//
(*
** HX: 10 points
**
** [mystream_235] returns a stream of integers
** enumerated in ascending order such that each
** integer in the stream can be written in the
** following form: (2^p)(3^q)(5^r), where the exponents
** p, q, and r are non-negative integers. For instance,
** the first few integers in this stream are:
** 1(=(2^0)(3^0)(5^0))
** 2(=(2^1)(3^0)(5^0))
** 3(=(2^0)(3^1)(5^0))
** 4(=(2^2)(3^0)(5^0))
** 5(=(2^0)(3^0)(5^1))
** 6(=(2^1)(3^1)(5^0))
** 8(=(2^3)(3^0)(5^0))
** 9(=(2^0)(3^2)(5^0))
** 10(=(2^1)(3^0)(5^1))
** 12(=(2^2)(3^1)(5^0))
** ...
**
*)
//
extern
fun mystream_235(): stream(int)
//
(* ****** ****** *)
//
// HX: 10 points
//
// A string is a pangram if it contains all of
// the letters in the (English) alphabet. Letters
// are case-insensitive here. Given a string, the
// function [pangram_check] returns true if and only
// if the string is a pangram.
//
extern
fun
pangram_check(text: string): bool
//
(* ****** ****** *)
//
datatype
mytree(a:t@ype) =
| mytree_nil of ()
| mytree_cons of (mytree(a), a, mytree(a))
//
(* ****** ****** *)
//
fun
{a:t@ype}
mytree_flatten
(
  t0: mytree(a)
) : list0(a) = aux(t0) where
{
//
fun
aux
(
t0: mytree(a)
) : list0(a) =
(
case+ t0 of
| mytree_nil() => list0_nil()
| mytree_cons(tl, x, tr) =>
  list0_append(aux(tl), cons0(x, aux(tr)))
)
//
} (* end of [mytree_flatten] *)
//
(* ****** ****** *)
//
// HX: 10 points
//
// mytree_flatten(list2brauntree(xs)) = xs
//
extern
fun
{a:t@ype}
list2brauntree(xs: list0(a)): mytree(a)
//
(* ****** ****** *)
//
// HX: 10 points
// [mytree_postordize] enumerates a
// given mytree-value in the post-order manner:
// For each node, the elements in its left subtree
// are enumnerated; then the elements in its right
// subtree are enumerated; then the element stored
// in the node is enumerated.
//
extern
fun
{a:t@ype}
mytree_postordize(t0: mytree(a)): stream(a)
//
(* ****** ****** *)
//
// HX: 10 points
//
// Given a list xs of length m and an
// integer n <= m, please find a stream
// of all the possible pairs (xs1, xs2)
// such that xs1 and xs2 are formed by taking
// elements from xs and
//   length(xs1) = n and length(xs2) = m-n
//
// Assume xs = (a,b,c,d) and n = 2. The returned
// stream should consist of the following 6 pairs:
// $tup((a, b), (c, d))
// $tup((a, c), (b, d))
// $tup((a, d), (b, c))
// $tup((b, c), (a, d))
// $tup((b, d), (a, c))
// $tup((c, d), (a, b))
//
extern
fun
{a:t@ype}
mylist_select
(
xs: list0(a), n: int
) : stream($tup(list0(a), list0(a)))
//
(* ****** ****** *)
//
(*
** HX: 10 points
**
** Given an ordered list, [mystream_group]
** returns another stream that consists of
** pairs indicating how many times each element
** in the given stream occurs.
**
** For instance, assume the following stream
** is given:
**
** ("a", "b", "b", "c", "d", "d", "d", ...)
**
** Then the returned stream should be
** ($tup("a", 1), $tup("b", 2), $tup("c", 1), $tup("d", 3), ...)
*)
//
extern
fun
{a:t@ype}
mystream_group
  (xs: stream(a)): stream($tup(a, int))
//
(* ****** ****** *)
//
// HX: 10 points
//
// [mystream_remdup] removes all the duplicates in a
// given stream. The second argument is a function for
// testing whether two elements in the stream are considered
// equal
//
// For instance, assume xs is
// (1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 5, ...)
// Then the returned stream should be (1, 2, 3, 4, 5, ...)
// (if [eqfn] is the usual equality on integers)
//
extern
fun
{a:t@ype}
mystream_remdup
  (xs: stream(a), eqfn: (a, a) -<cloref1> bool): stream(a)
//
(* ****** ****** *)

(*
**
** HX: 20 points
**
** Please see WordCounting (based on Divide-and-Conquer):
**
** Given a list of words, [WordCounting] returns a list
** of word-int pairs that is ordered according to the word
** part. For each pair (w, i), the number 'i' indicates
** the number of times 'w' occurs in the original given
** list (of words).
**
** Assume that the following list is given:
** ("b", "b", "a", "c", "d", "ae", "d", "af", "c", "c")
** The the following list is expected to be returned:
** (("a", 1), ("ae", 1), ("af", 1), ("b", 2), ("c", 3), ("d", 2))
**
*)

(* ****** ****** *)

(*
**
** HX: 20 points
**
** Please see DC_permute.dats
**
** Given a list xs, [DC_permute] returns a list of
** lists in which each list is a permutation of xs
**
** You are asked to implement a function of
** the name [DC_permute_combine], which is part
** of an implementation of DC_permute based on
** the divide-and-conquer problem-solving strategy.
*)

(* ****** ****** *)

(* end of [midterm-2.dats] *)
