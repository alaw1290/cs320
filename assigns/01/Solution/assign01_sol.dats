(* ****** ****** *)
//
(*
HX:
How to compile:
patscc -o assign01_sol assign01_sol.dats

How to test it:
./assign01_sol
*)
//
(* ****** ****** *)

(*
##myatsccdef=\
patscc -o $fname($1) $1 && ./$fname($1)
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#include "./../assign01.dats"

(* ****** ****** *)
//
(*
implement try_fact() = ...
*)
implement
try_fact() =
(fix loop(i: int, res: int): int =>
if res = 0
  then i else loop(i+1, (i+1)*res))(0, 1)
//
(* ****** ****** *)
//
(*
implement intsqrt(n0) = ...
*)
//
implement
intsqrt(n0) =
if
(n0 < 2)
then (n0)
else let
  val r1 =
    intsqrt(n0/4)
  // end of [val]
  val r2 = 2 * r1 + 1
in
  if r2*r2 <= n0 then r2 else r2 - 1
end // end of [intsqrt]
//
(* ****** ****** *)
//
// HX-2017-01-19:
// Please do not modify the following code
//
(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else

implement
main0() = () where
{
//
//
val () =
println!("try_fact() = ", try_fact())
//
val () =
println! ("intsqrt(1000) = ", intsqrt(1000))
val () =
println! ("intsqrt(1023) = ", intsqrt(1023))
val () =
println! ("intsqrt(1024) = ", intsqrt(1024))
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign01_sol.dats] *)
