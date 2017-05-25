(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -DATS_MEMALLOC_LIBC \
// -o choose_int_sol choose_int_sol.dats
//
// How to test it:
// ./choose_int_sol
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#include "./../assign05.dats"

(* ****** ****** *)

#include
"$PATSHOMELOCS\
/effectivats-divideconquer/mylibies.hats"

(* ****** ****** *)

#staload DC = $DivideConquer

(* ****** ****** *)
//
assume
$DC.input_t0ype =
  (list0(elt), int, int)
//
assume
$DC.output_t0ype = list0(list0(elt))
//
(* ****** ****** *)

local
//
implement
$DC.DC_base_test<>
(
@(xs, n, i)
) =
  if i = 0 then true else (i = n)
//
implement
$DC.DC_base_solve<>
(
@(xs, n, i)
) =
(
if i = 0
  then list0_sing(nil0) else list0_sing(xs)
// end of [DC_base_solve]
) (* end of [DC_base_solve] *)

implement
$DC.DC_divide<>
(
@(xs, n, i)
) = ts where
{
//
  val-list0_cons(_, xs) = xs
//
  val ts = list0_nil()
  val ts = list0_cons(@(xs, n-1, i), ts)
  val ts = list0_cons(@(xs, n-1, i-1), ts)
} (* end of [DC_divide] *)

implement
$DC.DC_conquer_combine<>
  (t0, rs) = r1 + r2 where
{
//
  val-list0_cons(x, xs) = t0.0
//
  val-list0_cons(r1, rs) = rs
  val-list0_cons(r2, rs) = rs
  val r1 = list0_mapcons<elt>(x, r1)
//
} (* end of [DC_conquer_combine] *)

in

implement
choose_list(xs, i) =
  $DC.DC_solve<>(@(xs, length(xs), i))

end // end of [local]

(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else

assume
choose_list_elt = int

implement
main0() = () where
{
//
val () =
println!
(
"Hello from [choose_list_sol]!"
) (* println! *)
//
val xs =
$list{int}
(
  0, 1, 2, 3, 4
) (* val *)
val xs = g0ofg1(xs)
//
val xss = choose_list(xs, 3)
//
val out = stdout_ref
//
val ((*void*)) =
  fprint_listlist0_sep(out, xss, "\n", ", ")
//
val ((*void*)) = fprint_newline(out)
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [choose_list_sol.dats] *)
