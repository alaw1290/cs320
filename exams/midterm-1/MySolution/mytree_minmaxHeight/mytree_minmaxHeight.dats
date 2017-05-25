(* ****** ****** *)

(*
** Midterm-1:
** mytree_minmaxHeight:
** 10 points
patscc -DATS_MEMALLOC_LIBC -o mytree_minmaxHeight mytree_minmaxHeight.dats
*)

(* ****** ****** *)

staload
"./../../midterm-1.dats"

(* ****** ****** *)


#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"


staload "./../../mylib/mytree.dats"


implement {a}
mytree_minmaxHeight(tree) = mytree_fold<a,@(int, int)>(
													tree, 
													lam(t_left, t, t_right) => 
														if (t_left.0 + 1) > (t_right.0 + 1) 
															then 
																if (t_left.1 + 1) < (t_right.1 + 1) 
																	then
																		@( t_left.0 + 1, t_left.1 + 1)
																	else
																		@( t_left.0 + 1, t_right.1 + 1)
															else 
																if (t_left.1 + 1) < (t_right.1 + 1) 
																	then
																		@( t_right.0 + 1, t_left.1 + 1)
																	else
																		@( t_right.0 + 1, t_right.1 + 1)

													,@(0, 0)
													)


(* ****** ****** *)

implement
main0 () =
{
//
val () =
println!
("Testing for mytree_minmaxHeight")
//
val tree1 : tree0(int) = tree0_cons ( 
	tree0_cons (
		tree0_cons (
			tree0_nil (),4,tree0_nil ()) 
	, 2, 
		tree0_cons (
			tree0_nil (),4,tree0_nil ()) )
		, 1, 
		tree0_cons (
			tree0_cons (
				tree0_nil (),4,tree0_nil ()) 
			, 3, 
				tree0_nil () ) )

val tree2 : tree0(int) = 
tree0_cons(  
	tree0_cons(  
		tree0_cons( 
			tree0_cons( tree0_nil() , 4 , tree0_nil()) 
		, 4 , tree0_nil())  
	, 4 , 
		tree0_nil()) 
, 4 , 
	tree0_cons( 
		tree0_cons( 
			tree0_cons( 
				tree0_cons( tree0_nil() , 4 , tree0_nil()) 
				, 4 , 
					tree0_cons( tree0_nil() , 4 , tree0_nil()))
			 , 4 , tree0_nil())
		 , 4 , 
		 	tree0_cons( tree0_nil() , 4 , tree0_nil()))) 


val test1 = mytree_minmaxHeight(tree1)
val () = println! (test1.0) //max
val () = println! (test1.1) //min

val () = println! () 

val test2 = mytree_minmaxHeight(tree2)
val () = println! (test2.0) //max
val () = println! (test2.1) //min
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mytree_minmaxHeight.dats] *)
