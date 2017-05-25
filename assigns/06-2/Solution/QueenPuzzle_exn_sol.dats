(* ****** ****** *)
//
// Please study the QueenPuzzle
// example and modify it so that
// only the first solution found
// is returned.
//
(* ****** ****** *)

#include "./../QueenPuzzle_exn.dats"

(* ****** ****** *)
//
extern
fun
QueenPuzzle_helper:
  (list0(int)) -> int(*dummy*)
//
(* ****** ****** *)
//
exception FirstSolExn of list0(int)
//
(* ****** ****** *)
//
implement
QueenPuzzle_exn() =
try
let
val _0_ =
QueenPuzzle_helper(nil0)
in
  $raise NotFoundExn()
end with ~FirstSolExn(xs) => xs
//
(* ****** ****** *)

typedef input = $DC.input_t0ype
typedef output = $DC.output_t0ype

(* ****** ****** *)

assume $DC.input_t0ype = list0(int)
assume $DC.output_t0ype = int(*dummy*)

(* ****** ****** *)
//
// HX: Please give your implementation here
//
(* ****** ****** *)


local

(* ****** ****** *)
//
implement
$DC.DC_base_test<>(xs) = (length(xs) = N)
//
implement
$DC.DC_base_solve<>(xs) = $raise FirstSolExn(xs)
//
(* ****** ****** *)
//
implement
$DC.DC_divide<>
  (xs) =
  aux(0) where
{
//
typedef
input = $DC.input
//
fun
aux
(
  i: int
) : list0(input) = let
//
fun
test
(
xs: list0(int), d: int
) : bool =
(
case+ xs of
| list0_nil() => true
| list0_cons(x, xs) =>
    if (x != i && abs(x-i) != d) then test(xs, d+1) else false
  // end of [list0_cons]
)
//
in
//
if
(i < N)
then
(
if
test(xs, 1)
then list0_cons(list0_cons(i, xs), aux(i+1))
else aux(i+1)
)
else list0_nil(*void*)
//
end // end of [aux]
//
} (* end of [DC_divide] *)
//
(* ****** ****** *)
//
implement
$DC.DC_conquer_combine<>(_, rs) = 0
//
(* ****** ****** *)

in (* in-of-local *)

implement
QueenPuzzle_helper(xs) = $DC.DC_solve<>(xs)

end // end of [local]

(* ****** ****** *)

(* end of [QueenPuzzle_exn_sol.dats] *)
