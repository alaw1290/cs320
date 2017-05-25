(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib/libatscc2js"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/mylibies.hats"
//
(* ****** ****** *)
//
#staload DC =
"{$LIBATSCC2JS}/BUCS320\
/DivideConquer/DATS/DivideConquer.dats"
//
(* ****** ****** *)
//
#define N 8
//
(* ****** ****** *)
//
extern
fun
QueenPuzzle(): stream(list0(int)) = "mac#"
//
(* ****** ****** *)

assume $DC.input_t0ype = list0(int)
assume $DC.output_t0ype = stream(list0(int))

(* ****** ****** *)

local

(* ****** ****** *)
//
implement
$DC.DivideConquer$base_test<>
  (xs) = (length(xs) = N)
//
implement
$DC.DivideConquer$base_solve<>
  (xs) = stream_make_sing(xs)
//
(* ****** ****** *)
//
implement
$DC.DivideConquer$divide<>
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

implement
$DC.DivideConquer$conquer$combine<>
  (x0, rs) = let
  val rs = stream_make_list0(rs)
in
  stream_make_cons(x0, stream_concat(rs))
end // $DC.DivideConquer$conquer$combine<>

(* ****** ****** *)

in (* in-of-local *)

implement
QueenPuzzle((*void*)) =
  $DC.DivideConquer$solve<>(list0_nil(*void*))

end // end of [local]

(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)
