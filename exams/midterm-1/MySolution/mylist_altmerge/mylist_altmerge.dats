(* ****** ****** *)

(*
** Midterm-1:
** mylist_altmerge: 10 points
patscc -DATS_MEMALLOC_LIBC -o mylist_altmerge mylist_altmerge.dats
*)

(* ****** ****** *)

staload
"./../../midterm-1.dats"

(* ****** ****** *)

staload "./../../mylib/mylist.dats"

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

#define nil0 list0_nil
#define :: list0_cons
#define cons0 list0_cons


implement {a}
mylist_altmerge(xs,ys) = aux_merge(xs,ys,list0_nil()) where {
	fun aux_merge(xs:list0(a) , ys:list0(a) , res:list0(a) ) : list0(a) = 
						case+ (xs, ys) of
							| (list0_nil(), y) => list0_append(res,y)
							| (x, list0_nil()) => list0_append(res,x)
							| (list0_cons(x, xs), list0_cons(y, ys)) => aux_merge( xs , ys , list0_append(res, x :: y :: nil0) )
}


(* ****** ****** *)

implement
main0 () =
{
//
val () =
println!
("Testing for mylist_altmerge")
//
val xs =
g0ofg1
(
$list{int}(1, 3, 5,7,9,11,13,15,17,19)
)
val ys =
g0ofg1
(
$list{int}(2, 4, 6, 8, 10,12,14,16,18,20,21,22,23,24,25)
)
//
val zs =
mylist_altmerge<int>(xs, ys)
//
val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)
val () = println! ("zs = ", zs)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist_altmerge.dats] *)
