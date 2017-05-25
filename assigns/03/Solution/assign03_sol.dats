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
implement
{a}(*tmp*)
mylist2_reverse(xs) =
  $UNSAFE.castvwtp0(list_reverse<a>($UNSAFE.cast(xs)))
*)
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
{a}(*tmp*)
mylist2_length
  (xs) = loop(xs, 0) where
{
fun
loop
(
  xs: mylist2(a), res: int
) : int =
  case+ xs of
  | mylist2_nil() => res
  | mylist2_cons(_, xs) => loop(xs, res+1)
} (* end of [mylist2_length] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist2_get_last
  (xs) =
  loop(x0, xs) where
{
//
val-
mylist2_cons(x0, xs) = xs
//
fun
loop
(
x0: a, xs: mylist2(a)
) : a =
  case+ xs of
  | mylist2_nil() => x0
  | mylist2_cons(x1, xs) => loop(x1, xs)
//
}

(* ****** ****** *)

implement
{a}(*tmp*)
mylist2_append
(
  xs, ys
) = aux(xs) where
{
//
fun
aux
(
xs: mylist2(a)
) : mylist2(a) =
(
case+ xs of
| mylist2_nil() => ys
| mylist2_cons(x, xs) => mylist2_cons(x, aux(xs))
) (* end of [aux] *)
//
} (* end of [mylist2_append] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist2_revappend
(
  xs, ys
) = aux(xs, ys) where
{
//
fun
aux
(
xs: mylist2(a)
,
ys: mylist2(a)
) : mylist2(a) =
(
case+ xs of
| mylist2_nil() => ys
| mylist2_cons(x, xs) => aux(xs, mylist2_cons(x, ys))
) (* end of [aux] *)
//
} (* end of [mylist2_revappend] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist2_foreach
(
  xs, fwork
) = loop(xs) where
{
//
fun
loop
(
xs: mylist2(a)
) : void =
(
case+ xs of
| mylist2_nil() => ()
| mylist2_cons(x, xs) => (fwork(x); loop(xs))
) (* end of [loop] *)
//
} (* end of [mylist2_foreach] *)

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
//
val ((*void*)) = println! ("xs_r = ", xs_r)
val ((*void*)) = println! ("xs_ys = ", xs_ys)
//
val () =
println!
(
"last(xs) = "
,
mylist2_get_last<int>(xs)
)
//
val () =
mylist2_foreach<int>
  (xs, lam(x) => print(x))
//
val ((*void*)) = println!((*void*))
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign03_sol.dats] *)
