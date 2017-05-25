(*
** mystream_235: 10 points
*)

(* ****** ****** *)

#include "./../../midterm-2.dats"

#include
"share/atspre_staload.hats"

#include
"share/HATS\
/atspre_staload_libats_ML.hats"

// patscc -DATS_MEMALLOC_LIBC -o mystream_group mystream_group.dats

(* ****** ****** *)

extern fun {a:t@ype} count_stream(xs:stream(a), x:a, count:int): int

implement
{a}(*tmp*)
count_stream(xs,x,count) = 
	case+ !xs of 
		| stream_nil() => count
		| stream_cons(y,xs) => (if y = x then count_stream(xs,x,count+1) else count)

implement
{a}(*tmp*)
mystream_group(xs) = 
	let
		fun aux(xs:stream(a), i:a) : stream(a) = 
			$delay(
					case+ !xs of 
						| stream_nil() => stream_nil()
						| stream_cons(x,xs) => 
								if i = x 
									then aux(xs,x)
									else
										let
											val count = count_stream(xs,x,0)
											val res = $tup(x,count)
										in
											stream_cons(res,aux(xs,x))
										end
				)
	in
		aux(xs,"")
	end




(* ****** ****** *)

implement
main0() = () where
{

val xs =
$list{string}
("a", "b", "b", "c", "d", "d", "d")
//
val xns = mystream_group<string>(stream_vt2t(streamize_list_elt(xs)))
//

} (* end of [main0] *)

(* ****** ****** *)

(* end of [mystream_group.dats] *)
