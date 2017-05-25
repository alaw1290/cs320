(*
** Wallis: 10 points
*)

(* ****** ****** *)

#include
"./../../midterm-2.dats"

#include
"share/atspre_staload.hats"

#include
"share/HATS\
/atspre_staload_libats_ML.hats"

// patscc -DATS_MEMALLOC_LIBC -o Wallis Wallis.dats

(* ****** ****** *)


implement
Wallis() = aux(1.0,2.0,1.0,true) where {
	fun aux(psum:double, i:double, j:double, switch:bool) : stream(double) =
		if switch 
			then $delay(stream_cons(psum * (i / j), aux(psum * (i / j), i, j+2.0, ~switch)))
			else $delay(stream_cons(psum * (i / j), aux(psum * (i / j), i+2.0, j, ~switch)))
}

(* ****** ****** *)

implement
main0() = () where
{
//
// Please write your own testing code
//
val a = stream_nth_exn(Wallis() , 0) // = 2 
val () = println!("W(0) = ", a)
val b = stream_nth_exn(Wallis() , 1) // = 1.3333
val () = println!("W(1) = ", b)
val c = stream_nth_exn(Wallis() , 2) // = 1.77777
val () = println!("W(2) = ", c)
val d = stream_nth_exn(Wallis() , 8) // = 1.65119
val () = println!("W(8) = ", d)
val e = stream_nth_exn(Wallis() , 100000) // ~= pi/2 = 1.570796
val () = println!("W(100000) = ", e)

} (* end of [main0] *)

(* ****** ****** *)

(* end of [Wallis.dats] *)
