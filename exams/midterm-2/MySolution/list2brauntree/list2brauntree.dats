(*
** list2brauntree: 10 points
*)

(* ****** ****** *)

#include "./../../midterm-2.dats"

#include
"share/atspre_staload.hats"

#include
"share/HATS\
/atspre_staload_libats_ML.hats"

// patscc -DATS_MEMALLOC_LIBC -o list2brauntree list2brauntree.dats

(* ****** ****** *)

fun
{a:t@ype}
mytree_size
  (t0: mytree(a)): int =
(
case+ t0 of
| mytree_nil() => 0
| mytree_cons(tl, _, tr) =>
  mytree_size<a>(tl)+1+mytree_size<a>(tr)
)

(* ****** ****** *)

fun
{a:t@ype}
isBrauntree
  (t0: mytree(a)): bool =
(
case+ t0 of
| mytree_nil() => true
| mytree_cons(tl, _, tr) =>
  isBrauntree<a>(tl) &&
  isBrauntree<a>(tr) &&
  (let
     val szl = mytree_size<a>(tl)
     val szr = mytree_size<a>(tr)
   in
     if szr <= szl then szl <= 1+szr else false
   end
  )
)

(* ****** ****** *)

//datatype
//mytree(a:t@ype) =
//| mytree_nil of ()
//| mytree_cons of (mytree(a), a, mytree(a))

implement
{a}(*tmp*)
list2brauntree(xs) = 
  case+ xs of 
    | list0_nil() => mytree_nil()
    | list0_cons(x,list0_nil()) => mytree_cons(mytree_nil(),x,mytree_nil())
    | list0_cons(x,xs) => (
        let
          val len =  list0_length(xs) + 1
          val left = list0_take_exn(xs, len/2)
          val right = list0_drop_exn(xs, len/2)
        in
          mytree_cons(list2brauntree(left),x,list2brauntree(right))
        end
      )

(* ****** ****** *)

implement
main0() = () where
{
//
val xs =
$list{int}
  (0,1,2,3,4,5,6,7,8,9,10)
//
val xs = g0ofg1_list(xs)
//
val t0 = list2brauntree<int>(xs)

val () = assertloc(isBrauntree<int>(t0))

val ys = mytree_flatten<int>(t0)
//
val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)
//

//
val xs =
$list{int}
  (0,1,2)
//
val xs = g0ofg1_list(xs)
//
val t0 = list2brauntree<int>(xs)

val () = assertloc(isBrauntree<int>(t0))

val ys = mytree_flatten<int>(t0)
//
val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)
//

//
val xs =
$list{int}
  (0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
//
val xs = g0ofg1_list(xs)
//
val t0 = list2brauntree<int>(xs)

val () = assertloc(isBrauntree<int>(t0))

val ys = mytree_flatten<int>(t0)
//
val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [list2brauntree.dats] *)
