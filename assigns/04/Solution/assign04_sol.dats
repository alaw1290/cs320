(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -DATS_MEMALLOC_LIBC \
// -o assign04_sol assign04_sol.dats
//
// How to test it:
// ./assign04_sol
//
(* ****** ****** *)

(*
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
*)

(* ****** ****** *)

#include "./../assign04.dats"

(* ****** ****** *)
//
// HX:
// mylist0_foldleft and mylist0_foldright
// are implemented as follows:
//
implement
{res}{a}
mylist0_foldleft = list0_foldleft<res><a>
implement
{a}{res}
mylist0_foldright = list0_foldright<a><res>
//
(* ****** ****** *)
//
// Please do you implementation as follows:
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist0_length(xs) =
mylist0_foldleft<int><a>
(
  xs, 0, lam (res, _) => res+1
) (* mylist0_length *)

implement
{a}(*tmp*)
mylist0_append
  (xs, ys) =
mylist0_foldright<a><list0(a)>
(xs, lam(x, res) => list0_cons(x, res), ys)

implement
{a}(*tmp*)
mylist0_revappend
  (xs, ys) =
mylist0_foldleft<list0(a)><a>
(xs, ys, lam(res, x) => list0_cons(x, res))

implement
{a}{b}(*tmp*)
mylist0_map_cloref
  (xs, fopr) =
mylist0_foldright<a><list0(b)>
(xs, lam(x, res) => list0_cons(fopr(x), res), list0_nil)

implement
{a}(*tmp*)
mylist0_filter_cloref
  (xs, test) =
mylist0_foldright<a><list0(a)>
( xs
, lam(x, res) => if test(x) then list0_cons(x, res) else res
, list0_nil
)

(* ****** ****** *)
//
// HX: Some testing code
// is provided as follows:
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
println!
(
"Hello from [assign04_sol]!"
) (* println! *)
//
val xs0 =
g0ofg1
(
$list{int}
(
0, 1, 2, 3, 4, 5, 6, 7, 8, 9
)
) (* end of [val] *)
//
val () =
println! ("xs0 = ", xs0)
val () =
println!
("|xs0| = ", mylist0_length<int>(xs0))
//
val xs0_evn =
mylist0_filter_cloref<int>
  (xs0, lam(x) => x % 2 = 0)
//
val () =
println! ("xs0_evn = ", xs0_evn)
//
val xs1 =
mylist0_map_cloref<int><int>(xs0, lam (x) => x * x)
//
val () = println! ("xs1 = ", xs1)
//
val xs0xs1 =
  mylist0_append<int>(xs0, xs1)
val () = println! ("xs0xs1 = ", xs0xs1)
//
val rxs0xs1 =
  mylist0_revappend<int>(xs0, xs1)
val () = println! ("rxs0xs1 = ", rxs0xs1)
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign04_sol.dats] *)
