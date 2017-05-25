//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Spring, 2017
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Hanwen Wu (hwwuATbuDOTedu)
//
(*
//
// Assignment #7
// Due Thursday, the 30th of March, 2017 at 11:59pm
//
*)
(* ****** ****** *)
//
#define
ATS_PACKNAME "ASSIGN07"
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
fun{}
myprint_double
  (x0: double) =
  myfprint_double<>(stdout_ref, x0)
and
myfprint_double
  (out: FILEref, x0: double): void =
  $extfcall(void, "fprintf", out, "%.12f", x0)
//
overload print with myprint_double of 100
overload fprint with myfprint_double of 100
//
(* ****** ****** *)

(*
//
// Points: 10
//
The following is a well-known series:

ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...

Please implement a stream consisting of all the partial sums of this
series.
//
*)
extern
fun
stream_ln2(): stream(double)

(* ****** ****** *)
//
// Points: 10
//
// Please implement the following function that enumerates
// all the pairs of natural numbers (i, j) satisfying i <= j:
//
typedef int2 = (int, int)
//
extern
fun
intpair_enumerate((*void*)): stream(int2)
//
(* ****** ****** *)
//
// HX: 10 points
// Please implement the Euler transform:
// Given a sequence:
//   x(0), x(1), x(2), ..., x(n), ...
// We can form another sequence:
//   y(0), y(1), y(2), ..., y(n), ....
// such that each y(n) equals the the follow value
//
// x(n+2) - (x(n+2)-x(n+1))^2 / (x(n)+x(n+2)-2*x(n+1))
//
extern
fun
EulerTrans(xs: stream(double)): stream(double)
//
(* ****** ****** *)

(* end of [assign07.dats] *)
