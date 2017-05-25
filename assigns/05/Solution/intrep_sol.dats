(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -DATS_MEMALLOC_LIBC \
// -o intrep_sol intrep_sol.dats
//
// How to test it:
// ./intrep_sol
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#include "./../assign05.dats"

(* ****** ****** *)
//
fun
intrep2int
(
xs: list0(int)
) : int =
list0_foldright<int><int>
(
  xs, lam(x, n) => 2*n + x, 0
) (* list0_foldright *)
//
(* ****** ****** *)
//
// Please give your implementation as follows:
//
(* ****** ****** *)

implement
intrep_add
  (xs, ys) =
  fadd(xs, ys) where
{
//
fun
succ
(
xs: intrep
) : intrep =
(
case+ xs of
| list0_nil() =>
  list0_sing(1)
| list0_cons(x, xs) => let
    val x1 = x + 1
  in
    if x1 >= 2
      then list0_cons(0, succ(xs)) else list0_cons(x1, xs)
    // end of [if]
  end // end of [list0_cons]
)
//
fun
fadd
(
xs: intrep
,
ys: intrep
) : intrep =
(
case+ (xs, ys) of
| (list0_nil(), _) => ys
| (_, list0_nil()) => xs
| (list0_cons(x, xs),
   list0_cons(y, ys)) => let
    val xy = x + y
    val xsys = fadd(xs, ys)
  in
    if xy >= 2
      then list0_cons(0, succ(xsys)) else list0_cons(xy, xsys)
    // end of [if]
  end // end of [cons, cons]
)
//
} (* end of [intrep_add] *)

(* ****** ****** *)

implement
intrep_mul
  (xs, ys) = let
//
fun
shift(xs: intrep): intrep =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons _ => list0_cons(0, xs)
)
//
in
//
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, xs) => let
    val xsys_0 =
      shift(intrep_mul(xs, ys))
    // end of [val]
  in
    if x >= 1 then intrep_add(ys, xsys_0) else xsys_0
  end // end of [list0_cons]
//
end // end of [intrep_mul]

(* ****** ****** *)
//
fun
int2intrep
(
 x: int
) : intrep =
  if x >= 2
    then list0_cons(x%2, int2intrep(x/2))
    else (if x >= 1 then list0_sing(x) else list0_nil())
  // end of [if]
//
(* ****** ****** *)

implement
intrep_power
  (x, n) = let
//
val () = assertloc(x >= 0)
val () = assertloc(n >= 0)
//
fun
power
(
 x: intrep, n: int
) : intrep =
  if n >= 2
    then let
      val x2 = intrep_mul(x, x)
      val res = power(x2, n / 2)
    in
      if n%2 >= 1
        then intrep_mul(x, res) else res
      // end of [if]
    end // end of [then]
    else (if n >= 1 then x else list0_sing(1))
//
in
  power(int2intrep(x), n)
end // end of [intrep_power]

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
"Hello from [intrep_sol]!"
) (* println! *)
//
val _10_ = int2intrep(10)
val _20_ = intrep_add(_10_, _10_)
val _100_ = intrep_mul(_10_, _10_)
//
val () =
println! (_10_)
val () =
println! (intrep2int(_10_))
val () =
println! (intrep2int(_20_))
val () =
println! (intrep2int(_100_))
//
val () =
println!
( "power(2, 10) = "
, intrep2int(intrep_power(2, 10)))
val () =
println!
( "power(3, 10) = "
, intrep2int(intrep_power(3, 10)))
//
val () =
println!("power(2, 100) = ", intrep_power(2, 100))
val () =
println!("power(3, 100) = ", intrep_power(3, 100))
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [intrep_sol.dats] *)
