(* ****** ****** *)
(*
** mylist_select: 10 points
*)
(* ****** ****** *)
//
// How to test:
// ./mylist_select
// How to compile:
// patscc -DATS_MEMALLOC_LIBC -o mylist_select mylist_select.dats
//
(* ****** ****** *)

#include "./../../midterm-2.dats"

(* ****** ****** *)

(*
implement
{a}(*tmp*)
mylist_select(xs, n) = ...
*)

(* ****** ****** *)

implement
main0() = () where
{
//
val xs =
$list{string}("a","b","c","d","e")
//
val xs = g0ofg1_list(xs)
val yszss = mylist_select(xs, 2)
//
val () = println! ("|yszss| = ", length(yszss))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist_select.dats] *)
