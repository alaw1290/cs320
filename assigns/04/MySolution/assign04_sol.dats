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

//implement {a} {ini} fold_left (xs, ini, fopr) = 
//	case+ xs of 
//	| nil () => ini
//	| cons (x, xs) => fold_left (xs, fopr (ini, x), fopr)

//implement {a} {res} fold_right (xs, fopr, snk) = 
//	case+ xs of 
//	| nil () => snk 
//	| cons (x, xs) => fopr (x, fold_right (xs, fopr (snk, x), snk))

implement {a}
mylist0_length(xs) = mylist0_foldleft<int><a>(xs, 0, lam (x,y) => x + 1)

implement {a}
mylist0_append(xs,ys) = mylist0_foldright<a><list0(a)>(xs, lam (x1,x2) => list0_cons(x1,x2), ys)

implement {a}
mylist0_revappend(xs,ys) = mylist0_append(mylist0_foldleft<list0(a)><a>(xs, list0_nil(), lam (x1,x2) => list0_cons(x2,x1)),ys)

implement {a}{b}
mylist0_map_cloref(xs,fopr) = mylist0_foldright<a><list0(b)>(xs, lam(x,y) => list0_cons(fopr(x),y), list0_nil())

implement {a}
mylist0_filter_cloref(xs,fopr) = mylist0_foldright<a><list0(a)>(xs, lam(x,y) => (if fopr(x) then list0_cons(x,y) else y), list0_nil())

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

val xs0_evn =
mylist0_filter_cloref<int>
  (xs0, lam(x) => x % 2 = 0)

val () =
println! ("xs0_evn = ", xs0_evn)

val xs1 =
mylist0_map_cloref<int><int>(xs0, lam (x) => x * x)

val () = println! ("xs1 = ", xs1)

val xs0xs1 =
  mylist0_append<int>(xs0, xs1)
val () = println! ("xs0xs1 = ", xs0xs1)

val rxs0xs1 =
  mylist0_revappend<int>(xs0, xs1)
val () = println! ("rxs0xs1 = ", rxs0xs1)

} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign04_sol.dats] *)
