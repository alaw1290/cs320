(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -o assign03_sol assign03_sol.dats
//
// How to test it:
// ./assign03_sol
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#include "./../assign03.dats"

(* ****** ****** *)
//
(*
implement
{a}(*tmp*)
mylist2_append
(
xs, ys
) =
$UNSAFE.cast
(
  list_append<a>($UNSAFE.cast(xs), $UNSAFE.cast(ys))
) (* end of [mylist2_append] *)
//
*)
implement
{a}(*tmp*)
mylist2_reverse(xs) =
  $UNSAFE.castvwtp0(list_reverse<a>($UNSAFE.cast(xs)))

//
(* ****** ****** *)
//
// HX-2017-02-07:
// Please do not modify the following code
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
print_mylist2
  : (mylist2(a)) -> void
extern
fun{a:t@ype}
fprint_mylist2
  : fprint_type(mylist2(a))
//
overload print with print_mylist2
overload fprint with fprint_mylist2
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
print_mylist2(xs) = fprint!(stdout_ref, xs)
//
implement
{a}(*tmp*)
fprint_mylist2(out, xs) =
  fprint_list<a>(out, $UNSAFE.cast{List0(a)}(xs))
//
(* ****** ****** *)
//
// Please do you implementation as follows:
//
(* ****** ****** *)

implement
{a}
mylist2_length(xs) = aux(0, xs) where {
	fun aux(i:int, xs: mylist2(a)): int = 
		case+ xs of 
		| mylist2_nil () => 1
		| mylist2_cons (x,xs) => aux(i+1,xs)
}

implement
{a}
mylist2_get_last(xs) = 
	case- xs of 
	| mylist2_cons (x,mylist2_nil ()) => x
	| mylist2_cons (x,xs) => mylist2_get_last(xs)

implement
{a}
mylist2_append(xs,ys) = 
	case+ xs of 
	| mylist2_nil () => ys
	| mylist2_cons (x,xs) => mylist2_cons(x,mylist2_append(xs,ys))

implement
{a}
mylist2_revappend(xs,ys) = mylist2_append(mylist2_reverse(xs),ys)

implement
{a}
mylist2_foreach(xs,fwork) =
	case+ xs of
	| mylist2_nil () => ()
	| mylist2_cons(x,xs) => (fwork(x);mylist2_foreach(xs,fwork))

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
#define nil mylist2_nil
#define :: mylist2_cons
#define cons mylist2_cons
//
val xs = 1 :: 2 :: 3 :: nil{int}()
val ys = 4 :: 5 :: 6 :: 7 :: nil{int}()
//
val xs_r = mylist2_reverse<int>(xs)
val xs_ys = mylist2_append<int>(xs, ys)
val xs_ys_r = mylist2_reverse<int>(xs_ys)
val ys_xs = mylist2_revappend<int>(xs,ys)
//
val ((*void*)) = println! ("xs_r = ", xs_r)
val ((*void*)) = println! ("xs_ys = ", xs_ys)
val ((*void*)) = println! ("xs_ys_r = ", xs_ys_r)
val ((*void*)) = println! ("ys_xs = ", ys_xs)
//
val () = println! ("last(xs) = ",mylist2_get_last<int>(xs))
val () = println! ("last(xs_ys_r) = ",mylist2_get_last<int>(xs_ys_r))
//
val () = mylist2_foreach<int> (xs, lam(x) => print(x))
val ((*void*)) = println!((*void*))
val () = mylist2_foreach<int> (xs, lam(x) => print(x+1))
//
val ((*void*)) = println!((*void*))
//


} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign03_sol.dats] *)
