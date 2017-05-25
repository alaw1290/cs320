(* ****** ****** *)

(*
** Using Divide-and-Conquer
** to compute all of the permutations
** of a given list.
**
** HX: 20 points
** Please read code and then implement
** the function [DC_permute_combine]
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#include
"$PATSHOMELOCS/effectivats-divideconquer/mylibies.hats"

(* ****** ****** *)

#staload DC = $DivideConquer

(* ****** ****** *)
//
extern
fun
DC_permute :
  list0(int) -> list0(list0(int))
//
extern
fun
DC_permute_combine
  (r1: list0(list0(int)), r2: list0(list0(int))): list0(list0(int))
//
(* ****** ****** *)
//
assume $DC.input_t0ype = list0(int)
assume $DC.output_t0ype = list0(list0(int))
//
(* ****** ****** *)

local

implement
$DC.DC_base_test<>
  (xs) = (length(xs) <= 1)
implement
$DC.DC_base_solve<>
  (xs) = list0_cons(xs, list0_nil)

implement
$DC.DC_divide<>(xs) =
  xss where
{
  val n = length(xs)
  val xs1 =
    list0_take_exn(xs, n/2)
  val xs2 =
    list0_drop_exn(xs, n/2)
  val xss = list0_pair(xs1, xs2)
}

implement
$DC.DC_conquer_combine<>
  (_, rs) = xss where
{
  val-list0_cons(r1, rs) = rs
  val-list0_cons(r2, rs) = rs
  val xss = DC_permute_combine(r1, r2)
}

in

implement
DC_permute(xs) = $DC.DC_solve<>(xs)

end (* end of [local] *)

(* ****** ****** *)

(*
** Please implement [DC_permute_combine] here:
*)

//DC_permute_combine(r1: list0(list0(int)), r2: list0(list0(int))): list0(list0(int))
implement DC_permute_combine(r1,r2) = 

(* ****** ****** *)

implement main0() = 
{
//
val xs =
$list{int}(1,2,3,4,5)
//
val xs = g0ofg1_list(xs)
//
val xss = DC_permute(xs)
//
val ((*void*)) = println! ("|xss| = ", length(xss))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [DC_permute.dats] *)
