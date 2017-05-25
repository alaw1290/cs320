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
// Due date: Wednesday, the 22nd of February
//
(* ****** ****** *)

#define
ATS_PACKNAME "ASSIGN04"

(* ****** ****** *)
//
// HX: Total = 55 points
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
// HX: mylist0_foldleft is given // plz don't implement it
//
extern
fun{
res:t0p}{a:t0p
} mylist0_foldleft
  (list0((a)), ini: res, fopr: (res, a) -<cloref1> res): res
//
// HX: mylist0_foldright is given // plz don't implement it
//
extern
fun{
a:t0p}{res:t0p
} mylist0_foldright
  (xs: list0(a), fopr: (a, res) -<cloref1> res, snk: res): res
//
(* ****** ****** *)
//
// HX: 05 points
// Please implement mylist0_length based on mylist0_foldleft
// (This requirement must be met in order to receive any credit)
//
extern
fun
{a:t@ype}
mylist0_length(xs: list0(a)): int
//
(* ****** ****** *)
//
// HX: 05 points
// Please implement mylist0_append based on mylist0_foldright
// (This requirement must be met in order to receive any credit)
//
extern
fun
{a:t@ype}
mylist0_append
  (xs: list0(a), ys: list0(a)): list0(a)
//
(* ****** ****** *)
//
// HX: 05 points
// Please implement mylist0_repappend based on mylist0_foldleft
// (This requirement must be met in order to receive any credit)
//
extern
fun
{a:t@ype}
mylist0_revappend
  (xs: list0(a), ys: list0(a)): list0(a)
//
(* ****** ****** *)
//
// HX: 05 points
// Plz implement mylist0_map_cloref based on mylist0_foldright
// (This requirement must be met in order to receive any credit)
//
extern
fun
{a:t@ype}
{b:t@ype}
mylist0_map_cloref
  (xs: list0(a), fopr: (a) -<cloref1> b): list0(b)
//
(* ****** ****** *)
//
// HX: 05 points
// Plz implement mylist0_filter_cloref based on mylist0_foldright
// (This requirement must be met in order to receive any credit)
//
extern
fun
{a:t@ype}
mylist0_filter_cloref
  (xs: list0(a), test: (a) -<cloref1> bool): list0(a)
//
(* ****** ****** *)

(*
//
// HX:
// Sierpinski carpets (30 points)
// Please see the files in Sierpinski/.
// Please see the files in Sierpinski/MySolution/.
//
*)

(* ****** ****** *)

(* end of [assign04.dats] *)
