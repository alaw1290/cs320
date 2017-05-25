(* ****** ****** *)
//
// Due: Thursday:
// The 23rd of March, 2017
//
(* ****** ****** *)
//
// Please study the QueenPuzzle
// example and modify it so that
// only the first solution found
// is returned.
//
(* ****** ****** *)
//
// HX: 10 points
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
#include
"$PATSHOMELOCS\
/effectivats-divideconquer/mylibies.hats"
//
#staload DC = $DivideConquer
//
(* ****** ****** *)
//
#define N 8
//
(* ****** ****** *)
//
extern
fun
QueenPuzzle_opt(): Option(list0(int))
//
(* ****** ****** *)

implement
main0((*void*)) = 
{
//
val-
Some(xs) = QueenPuzzle_opt()
//
val () =
xs.rforeach()
(
lam x =>
(
(x).repeat()(lam() => print ". ");
print "Q ";
(N-1-x).repeat()(lam() => print ". "); println!()
)
) (* end of [val] *)
//
} (* end of [main0] *)

(* ****** ****** *)
//
// HX: Please write your code as follows:
// 
(* ****** ****** *)

(* end of [QueenPuzzle_opt.dats] *)
