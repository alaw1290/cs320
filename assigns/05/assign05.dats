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
// Instructor:
// Hongwei Xi (hwxiATcsDOTbuDOTedu)
//
(* ****** ****** *)
//
// Due date: Thursday, the 2nd of March
//
(* ****** ****** *)

#define
ATS_PACKNAME "ASSIGN05"

(* ****** ****** *)
//
// HX: Total = 40 points + 10 bonus points
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
typedef
intrep = list0(int) // only containing 0 and 1
//
// Note that one's digit comes first:
//
// For instance, '8' is represented as [0, 0, 0, 1]
// For instance, '11' is represented as [1, 1, 0, 1]
//
(* ****** ****** *)
//
// HX: 10 points
// HX: integer addition based on [intrep]
//
extern
fun
intrep_add : (intrep, intrep) -> intrep
//
(* ****** ****** *)
//
// HX: 10 points
// HX: integer multiplication based on [intrep]
//
extern
fun
intrep_mul : (intrep, intrep) -> intrep
//
(* ****** ****** *)
//
// HX: 10 points
// HX: write a problem to find the value of x and n
// where x and n are natural numbers:
//

extern
fun
intrep_power : ((*x*)int, (*n*)int) -> intrep
//
(* ****** ****** *)
//
// Please implement
// choose_int and choose_list based on
// DC_solve (and its associated templates)
// declared in the [effectivats-divideconquer]
// npm-package (for ATS):
//
(* ****** ****** *)
//
// HX: 10 points
// 
// Assume 0 <= i <= n
//
// choose_int(n, i) returns the number of ways
// to choose (i) items out of (n) distinct items
// For instance,
//
// choose_int(5, 0) = 1
// choose_int(5, 1) = 5
// choose_int(5, 2) = 10
// choose_int(5, 3) = 10
// choose_int(5, 4) = 5
// choose_int(5, 5) = 1
//
// Please have all your code in choose_int_sol.dats
//
extern
fun
choose_int
  (n: int, i: int): int
//
(* ****** ****** *)
//
// HX: 10 bonus points
//
//
// HX: 10 points
// 
// Assume 0 <= i <= length(xs)
//
// choose_list(xs, i) returns the combinations
// formed by choosing (i) items out of xs (that
// contains at least (i) distinct items)
//
// For instance, choose_list([0,1,2,3,4], 3) yields
// the following 10 combinations:
//
// 0, 1, 2
// 0, 1, 3
// 0, 1, 4
// 0, 2, 3
// 0, 2, 4
// 0, 3, 4
// 1, 2, 3
// 1, 2, 4
// 1, 3, 4
// 2, 3, 4
//
// Please have all your code in choose_list_sol.dats
//
abst@ype
choose_list_elt
//
typedef elt  = choose_list_elt
//
extern
fun
choose_list
  (xs: list0(elt), i: int): list0(list0(elt))
//
(* ****** ****** *)

(* end of [assign05.dats] *)
