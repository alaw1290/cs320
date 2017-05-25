(* ****** ****** *)

(*
** Midterm-1:
** mylist_average:

patscc -DATS_MEMALLOC_LIBC -o mylist_average mylist_average.dats

//
HX: 10 points
HX: 20 points if done solely based on combinators
HX: Please study mylist_foldleft and mylist_ifoldleft
    in ./../../mylib/mylist
//
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

implement 
mylist_average(xs) = 
					let
						val added_xs = mylist_foldleft<double,list0(double)>(xs, list0_nil() , lam(ini,x) => (case+ ini of 
																								| list0_nil() => list0_cons(x,list0_nil())
																								| list0_cons(i,is) => list0_cons(x+i, ini)
																							))

						val length_xs = mylist_foldleft<double,list0(int)>(xs, list0_nil() , lam(ini,x) => (case+ ini of 
																								| list0_nil() => list0_cons(1,list0_nil())
																								| list0_cons(i,is) => list0_cons(i+1, ini)
																							))

					in
						mylist_foldleft<int,list0(double)>(length_xs,list0_nil(), lam(ini,x) => (case+ ini of 
																								| list0_nil() => list0_cons( list0_nth_exn(added_xs,length(added_xs) - x)/ x,list0_nil())
																								| list0_cons(i,is) => list0_cons( list0_nth_exn(added_xs,length(added_xs) - x) / x, ini)
																							))
					end


(* ****** ****** *)

implement
main0 () =
{
//
val () =
println!
("Testing for mylist_average")
//
val xs =
g0ofg1
(
$list{double}
(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0)
)
//
val ys = mylist_average(xs)
//
//ys = 1.000000, 1.500000, 2.000000, 2.500000, 3.000000
val () = println! ("ys = ", ys)
//
val xs =
g0ofg1
(
$list{double}
(50.0,20.0,50.0,20.0,60.0,1.0)
)
//
//ys = 50.000000, 35.000000, 40.000000, 35.000000, 40.000000, 33.500000
val ys = mylist_average(xs)

val () = println! ("ys = ", ys)

} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist_average.dats] *)
