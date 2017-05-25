(* ****** ****** *)

(*
** Midterm-1:
** mytree_filter: 10 points
patscc -DATS_MEMALLOC_LIBC -o mytree_filter mytree_filter.dats
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
mytree_filter(tree, test) = mytree_fold<a,list0(a)>(tree, 
													lam(t_left, t, t_right) => 
															if test(t) 
																then list0_append(t_left, list0_cons(t, t_right))
																else list0_append(t_left, t_right)
													,list0_nil()) 

(* ****** ****** *)

implement
main0 () =
{
//
val () = println!("Testing for mytree_filter")
val tree1 : tree0(int) = tree0_cons ( tree0_cons (tree0_cons (tree0_nil (),4,tree0_nil ()) , 2, tree0_cons (tree0_nil (),4,tree0_nil ()) ), 1, tree0_cons (tree0_cons (tree0_nil (),4,tree0_nil ()) , 3, tree0_cons (tree0_nil (),4,tree0_nil ()) ) )
val tree2 : tree0(int) = 
tree0_cons(  
	tree0_cons(  
		tree0_cons( 
			tree0_cons( tree0_nil() , 3 , tree0_nil()) 
		, 4 , tree0_nil())  
	, 3 , 
		tree0_cons( tree0_nil() , 4 , tree0_nil()))  
, 4 , 
	tree0_cons( 
		tree0_cons( 
			tree0_cons( 
				tree0_cons( tree0_nil() , 4 , tree0_nil()) 
				, 4 , 
					tree0_cons( tree0_nil() , 4 , tree0_nil()))
			 , 3 , tree0_nil())
		 , 4 , 
		 	tree0_cons( tree0_nil() , 4 , tree0_nil()))) 

val test1 = mytree_filter(tree1, lam(x) => x < 3)
val () = println! (test1)

val test2 = mytree_filter(tree2, lam(x) => x = 3)
val () = println! (test2)

} (* end of [main0] *)

(* ****** ****** *)

(* end of [mytree_filter.dats] *)
