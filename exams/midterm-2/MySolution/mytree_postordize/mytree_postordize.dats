(*
** mytree_postordize: 10 points
*)

(* ****** ****** *)

#include "./../../midterm-2.dats"

#include
"share/atspre_staload.hats"

#include
"share/HATS\
/atspre_staload_libats_ML.hats"

// patscc -DATS_MEMALLOC_LIBC -o mytree_postordize mytree_postordize.dats

(* ****** ****** *)

//datatype
//mytree(a:t@ype) =
//| mytree_nil of ()
//| mytree_cons of (mytree(a), a, mytree(a))

//extern
//fun{a:t0p}
//mystream_sing(a): stream(a)

//implement
//{a}
//mystream_sing(x) = stream_cons(x, stream_nil())

implement
{a}(*tmp*)
mytree_postordize(n) = $delay(
		case+ n of 
			| mytree_nil() => stream_nil()
			| mytree_cons(l, c, r) => 
				let 
					val left = mytree_postordize(l)
					val right = mytree_postordize(r)
					val last = stream_make_sing(c)
					val lr_stream = stream_append(left,right)
				in 
					!(stream_append(lr_stream,last))
				end
	)

(* ****** ****** *)

implement
main0() = () where
{ 

val t0 = mytree_nil()
val t1 = mytree_cons(t0, 1, t0)
val t2 = mytree_cons(t0, 2, t0)
val t3 = mytree_cons(t1, 3, t2)
val t4 = mytree_cons(t1, 4, t2)
val t5 = mytree_cons(t3, 5, t4)

val ys = mytree_flatten<int>(t5)
val () = println!("t0 = ", ys)

val xs = mytree_postordize<int>(t5)
val () = println! ("|xs| = ", length(xs))
val () = println! ("(xs) = ", list0_of_list_vt(stream2list(xs)))
// 1 2 3 1 2 4 5

val t6 = mytree_cons{int}(
 mytree_cons (mytree_cons (mytree_cons(mytree_nil(), 7, mytree_nil()), 4, mytree_nil ()), 2, mytree_cons(mytree_nil(), 5, mytree_nil()))
,
1
,
 mytree_cons (mytree_cons (mytree_cons(mytree_nil(), 8, mytree_nil()), 6, mytree_cons(mytree_nil(), 9, mytree_nil())), 3, mytree_nil ())
)

val ys = mytree_flatten<int>(t6)
val () = println!("t0 = ", ys)

val xs = mytree_postordize<int>(t6)
val () = println! ("|xs| = ", length(xs))
val () = println! ("(xs) = ", list0_of_list_vt(stream2list(xs)))
// 7 4 5 2 8 9 6 3 1 

} (* end of [main0] *)

(* ****** ****** *)

(* end of [Y_draw.dats] *)
