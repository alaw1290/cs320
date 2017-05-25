(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -o assign00_sol assign00_sol.dats
//
// How to test it:
// ./assign00_sol
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#include "./../assign00.dats"

(* ****** ****** *)

implement
isTriangle(x, y, z) =
if (x + y > z && y + z > x && z + x > y) then true else false

(* ****** ****** *)
//
implement
fib_trec(n) =
loop(n, 0, 1) where
{
//
fun loop(n: int, f0: int, f1: int): int =
  if n >= 2 then loop(n-1, f1, f0+f1) else (if n >= 1 then f1 else f0) 
//
} (* end of [fib_trec] *)
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
val () =
assertloc(isTriangle(3,4,5))
val () =
assertloc(isTriangle(5,4,3))
val () =
assertloc(~isTriangle(1,2,3))
val () =
assertloc(~isTriangle(3,2,1))
//
val () =
println!
("Testing of [isTriangle] is done successfully!")
//
val fib =
fix f(n: int): int =>
  if n >= 2 then f(n-1)+f(n-2) else n
//
val () = assertloc(fib(5) = fib_trec(5))
val () = assertloc(fib(10) = fib_trec(10))
val () = assertloc(fib(20) = fib_trec(20))
//
val () = println! ("fib_trec(5) = ", fib_trec(5))
val () = println! ("fib_trec(10) = ", fib_trec(10))
val () = println! ("fib_trec(20) = ", fib_trec(20))
//
val () =
println! ("Testing of [fib_trec] is done successfully!")
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign00_sol.dats] *)
