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
$DC.input_t0ype = (int, int)
//
assume $DC.output_t0ype = int
//
(* ****** ****** *)

local
//
implement
$DC.DC_base_test<>
  (@(n, i)) =
  if i = 0 then true else (i = n)
//
implement
$DC.DC_base_solve<>(@(n, i)) = 1

implement
$DC.DC_divide<>(@(n, i)) =
  xs where
{
  val xs = list0_nil()
  val xs = list0_cons(@(n-1, i), xs)
  val xs = list0_cons(@(n-1, i-1), xs)
}

implement
$DC.DC_conquer_combine<>
  (_, rs) = r1 + r2 where
{
  val-list0_cons(r1, rs) = rs
  val-list0_cons(r2, rs) = rs
}

in

implement
choose_int(n, i) = $DC.DC_solve<>(@(n, i))

end // end of [local]

(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else

implement
main0() = () where
{
//
val () =
println!
(
"Hello from [choose_int_sol]!"
) (* println! *)
//
val () =
println!
("choose(5, 2) = ", choose_int(5, 2))
//
val () =
println!
("choose(10, 4) = ", choose_int(10, 4))
val () =
println!
("choose(10, 5) = ", choose_int(10, 5))
val () =
println!
("choose(10, 6) = ", choose_int(10, 6))
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [choose_int_sol.dats] *)
