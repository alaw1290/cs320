(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -o assign01_sol assign01_sol.dats
//
// How to test it:
// ./assign01_sol
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#include "./../assign01.dats"

(* ****** ****** *)


implement try_fact() = loop(0) where
{
	fun loop (i:int) : int = 
		if fact(i) != 0 then loop(i+1) else i
}


(* ****** ****** *)


implement intsqrt(n0) = 
let
	fun intsqrt_search (i:int,j:int,k:int) : int =
		let 
			val m = (i + j) / 2
		in
			if (m * m <= k) && ((m+1) * (m+1) > k) 
				then m
				else
					if ((m * m) > k)
						then intsqrt_search(i,m,k)
						else intsqrt_search(m,j,k)
		end //end of let
in 
	intsqrt_search(1,n0/2,n0)
end

(* ****** ****** *)
//
// HX-2017-01-19:
// Please do not modify the following code
//
(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else

implement
main0() = () where
{
//
//
val () =
println!("try_fact() = ", try_fact())
//
val () =
println! ("intsqrt(60) = ", intsqrt(60))
val () =
println! ("intsqrt(64) = ", intsqrt(64))
val () =
println! ("intsqrt(255) = ", intsqrt(255))
val () =
println! ("intsqrt(256) = ", intsqrt(256))
val () =
println! ("intsqrt(1000) = ", intsqrt(1000))
val () =
println! ("intsqrt(1023) = ", intsqrt(1023))
val () =
println! ("intsqrt(1024) = ", intsqrt(1024))
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign01_sol.dats] *)
