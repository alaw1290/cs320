(*
** Y_draw: 10 points
*)

(* ****** ****** *)

#include "./../../midterm-2.dats"

#include
"share/atspre_staload.hats"

#include
"share/HATS\
/atspre_staload_libats_ML.hats"

// patscc -DATS_MEMALLOC_LIBC -o Y_draw Y_draw.dats

(* ****** ****** *)



implement
Y_draw(m) = aux(0,m) where{
//	fun loop(i:int) : void = let
//		val () = print" "
//	in
//		if i > loop
	fun aux(i:int, n:int) : void = 
	if i < n 
		then 
			let
				val () = (i).repeat()(lam() => print" ")
				val () = print"*"
				val () = if n-i = 1 then print" " else ((n-i) + (n-i-1)).repeat()(lam() => print" ")
				val () = print"*"
				val () = println!("")
			in 
				aux(i+1,n)
			end  
		else if n >= 0
			then 
				let
					val () = (i).repeat()(lam() => print" ")
					val () = print"*"
					val () = println!("")
				in
					aux(i,n-1)
				end
	
}

(* ****** ****** *)

implement
main0() = () where
{
//
val () = Y_draw(1)
val () = println!("")
val () = Y_draw(2)
val () = println!("")
val () = Y_draw(3)
val () = println!("")
val () = Y_draw(5)
val () = println!("")
val () = Y_draw(10)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [Y_draw.dats] *)
