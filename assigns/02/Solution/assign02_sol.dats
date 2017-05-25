(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -o assign02_sol assign02_sol.dats
//
// How to test it:
// ./assign02_sol
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#include "./../assign02.dats"

(* ****** ****** *)
//
(*
implement
show_triangle(n) = ...
*)
//
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
implement
show_triangle
  (n) =
(
(n).foreach()
(
lam(i) =>
(
(n-1-i).repeat()(lam() => print" ");
(2*i+1).repeat()(lam() => print"*");
(n-1-i).repeat()(lam() => print" "); println!()
)
)
) (* end of [show_trianggle] *)
//
(* ****** ****** *)

implement
print_digit_2
(
 // argless
) =
print!("\
XXXXXXXXX
        X
        X
        X
XXXXXXXXX
X
X
X
XXXXXXXXX
")

(* ****** ****** *)

implement
print_digit_7
(
 // argless
) =
print!("\
XXXXXXXXX
        X
        X
        X
        X
        X
        X
        X
        X
")

(* ****** ****** *)

(*
implement
print_digit_?
*)

(* ****** ****** *)

(*
implement MS(n) = ...
*)

(* ****** ****** *)

extern
fun solve(n: int): int
extern
fun solve$base(n: int): int
and solve$base_test(n: int): bool
and solve$recarg(n: int): int
and solve$assmbl_aft(n: int, res: int): int

(* ****** ****** *)

implement
solve(n) =
if
solve$base_test(n)
then solve$base(n)
else let
//
val res =
  solve(solve$recarg(n))
//
in
  solve$assmbl_aft(n, res)
end

(* ****** ****** *)

implement MS(n) = solve(n)

(* ****** ****** *)
//
implement
solve$base(n) = 1
//
implement
solve$base_test(n) =
  if n >= 2 then false else true
//
implement
solve$recarg(n) = n / 2
//
implement
solve$assmbl_aft(n, res) = 2 * res + n
//
(* ****** ****** *)
//
// HX-2017-01-29:
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
val () = show_triangle(3)
val () = show_triangle(5)
//
val () = print_digit_2() // you need to change ?
val () = print_digit_7() // you need to change ? 
//
val () = println!("MS(1000) = ", MS(1000))
val () = println!("MS(10000) = ", MS(10000))
val () = println!("MS(100000) = ", MS(100000))
val () = println!("MS(1000000) = ", MS(1000000))
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign02_sol.dats] *)
