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

// patscc -DATS_MEMALLOC_LIBC -o mystream_235 mystream_235.dats

(* ****** ****** *)

extern fun max_divide(a:int, b:int) : int
implement
max_divide(a,b) = if a%b = 0 then max_divide(a/b,b) else a

extern fun checkUgly(x:int) : bool
implement
checkUgly(x) = 
	let
		val test = max_divide(x,2)
		val test = max_divide(test,3)
		val test = max_divide(test,5)
	in
		if test = 1 then true else false
	end

extern fun findNextUgly(x:int) : int
implement
findNextUgly(x) = 
	if checkUgly(x) then x else findNextUgly(x+1)


implement
mystream_235() = aux(1) where {
	fun aux(i:int): stream(int) = 
		let
			val un = findNextUgly(i)
		in
			$delay(stream_cons(un,aux(un+1)))
		end
}


(* ****** ****** *)

implement
main0() = () where
{
//
val xs = mystream_235()
//
val ys = list_vt2t(stream2list_vt(stream_takeLte(xs, 150)))
//
val () = println! ("ys = ", ys) //5832 is 150th ugly number
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mystream_235.dats] *)
