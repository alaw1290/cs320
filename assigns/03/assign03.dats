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
// Due date: Wednesday, the 15th of February
//
(* ****** ****** *)

#define
ATS_PACKNAME "ASSIGN03"

(* ****** ****** *)
//
// HX: Total = 50 points
//
(* ****** ****** *)
//
// HX:
// Only for integer lists
//
datatype
mylist =
| mylist_nil of ()
| mylist_cons of (int, mylist)
//
(* ****** ****** *)
//
// HX: polymorphic list type
//
datatype
mylist2(a:t@ype) =
| mylist2_nil of ()
| mylist2_cons of (a, mylist2(a))
//
(* ****** ****** *)
//
// HX: 10 points
// Please give a tail-recursive
// implementation of mylist2_length
//
extern
fun
{a:t@ype}
mylist2_length
  (xs: mylist2(a)): int
//
(* ****** ****** *)
//
// HX: 10 points
// for [mylist2_get_last]
// which returns the last element
// of a given list
//
extern
fun
{a:t@ype}
mylist2_get_last
  (xs: mylist2(a)): (a)
//
(* ****** ****** *)
//
// HX: 10 points
// for [mylist2_append]
//
extern
fun
{a:t@ype}
mylist2_append
(xs: mylist2(a)
,ys: mylist2(a)): mylist2(a)
//
(* ****** ****** *)
//
// HX: it is implemented
//
extern
fun
{a:t@ype}
mylist2_reverse
(xs: mylist2(a)): mylist2(a)
//
// HX: 10 points
// for [mylist2_revappend]
//
extern
fun
{a:t@ype}
mylist2_revappend
( xs: mylist2(a)
, ys: mylist2(a)): mylist2(a)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
mylist2_reverse(xs) =
  mylist2_revappend<a>(xs, mylist2_nil)
//
(* ****** ****** *)
//
// HX: 10 points
// for [mylist2_foreach]
// which applies its 2nd argument
// (a closure-function) to each element
// in its first argument (a list):
//
extern
fun
{a:t@ype}
mylist2_foreach
(
xs: mylist2(a), fwork: (a) -<cloref1> void
) : void // end of [mylist2_foreach]
//
(* ****** ****** *)

(* end of [assign03.dats] *)
