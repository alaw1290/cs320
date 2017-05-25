(* ****** ****** *)

(*
** Midterm-1:
** mylist_pairing: 10 points
patscc -DATS_MEMALLOC_LIBC -o mylist_pairing mylist_pairing.dats
*)

(* ****** ****** *)

staload
"./../../midterm-1.dats"

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"


fun {a:t0ype} aux_pairing(xs:list0(a) , res: list0(@(a, a))): list0(@(a, a)) = if length(xs) > 0
																					then 
																						let
																							val elem = @(list0_head_exn(xs),list0_last_exn(xs))
																							val xs = list0_remove_at_exn(xs,0)
																							val xs = list0_remove_at_exn(xs,length(xs)-1)
																						in
																							aux_pairing<a>(xs,list0_append(res, list0_cons(elem,list0_nil()) )) 
																						end
																					else
																						res

implement {a}
mylist_pairing(xs) = 
					let
						val first_elem = @(list0_head_exn(xs),list0_last_exn(xs))
						val xs = list0_remove_at_exn(xs,0)
						val xs = list0_remove_at_exn(xs,length(xs)-1)
					in
						aux_pairing<a>(xs,list0_cons(first_elem,list0_nil())) 
					end

(* ****** ****** *)

implement
main0 () =
{
//
val () = println! ("Testing for mylist_pairing")
//

val xs = g0ofg1( $list{int} (1, 2, 3, 4, 5, 6) )
//
val ys = mylist_pairing<int>(xs)
//
//((1, 6), (2, 5), (3, 4))
val () = println! ("ys = ", ys)
//
//
val () = println! ("Testing for mylist_pairing")
//
val xs = g0ofg1( $list{int} (1,2,3,4,5,6,7,8,9,10,11,11,10,9,8,7,6,5,4,3,2,1) )
//
val ys = mylist_pairing<int>(xs)
//
//(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (11, 11)
val () = println! ("ys = ", ys)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist_pairing.dats] *)
