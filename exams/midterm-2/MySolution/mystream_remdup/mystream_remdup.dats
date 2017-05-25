(*
** mystream_remdup: 10 points
*)

(* ****** ****** *)

#include "./../../midterm-2.dats"

#include
"share/atspre_staload.hats"

#include
"share/HATS\
/atspre_staload_libats_ML.hats"

// patscc -DATS_MEMALLOC_LIBC -o mystream_remdup mystream_remdup.dats

(* ****** ****** *)


implement
{a}(*tmp*)
mystream_remdup(xs, eqfn) = $delay(
	case+ !xs of
		| stream_nil() => stream_nil() 
		| stream_cons(x,xs) => 
			let
				val filtered_xs = stream_filter_cloref(xs,lam(i) => $effmask_all(~eqfn(x,i)))
			in
				stream_cons(x,mystream_remdup(filtered_xs,eqfn))
			end
	)

(* ****** ****** *)

implement
main0() = () where
{
val xs = $list{int}(1,1,2,1,2,3,1,2,3,4,1,2,3,4,5,6,6,6,6,6,6,6,6,66,7)
val xns = mystream_remdup<int>(stream_vt2t(streamize_list_elt(xs)), lam (x, y) =<cloref1> x = y)
val () = println!(list_vt2t(stream2list_vt(stream_takeLte(xns, 8))))
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mystream_remdup.dats] *)
