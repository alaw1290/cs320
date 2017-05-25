(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -o assign02_sol assign02_sol.dats
//
// How to test it:
// ./assign02_sol
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#include "./../assign02.dats"

(* ****** ****** *)


fun construct_triangle_level(nspace_head:int, nstar:int, nspace_tail:int) : void = 
	if nspace_head > 0
		then (print!(" "); 
			construct_triangle_level(nspace_head - 1,nstar,nspace_tail))
		else
			if nstar > 0 
				then (print!("*"); 
					construct_triangle_level(nspace_head,nstar - 1,nspace_tail))
				else
					if nspace_tail > 0
						then (print!(" "); 
							construct_triangle_level(nspace_head,nstar,nspace_tail - 1))		
						else print!("\n") 

implement
show_triangle(n) = triangle(1, n * 2  - 1) where {
	fun triangle (level:int, width:int): void =
		let
			// # stars at this level
			val num_star = 2 * level - 1
			// # spaces before and after stars
			val buffer = (width - num_star) / 2
		in
		if (level <= n) 
			then
				let
					val () = construct_triangle_level(buffer, num_star, buffer)
				in
					triangle(level + 1, width)
				end
			else
				let
					val () = println!("")
				in
				end
		end
	}

(* ****** ****** *)


implement
print_digit_3() = 
	let
		val () = println!("XXXXXXXX\n        X\n        X\n        X\nXXXXXXXX\n        X\n        X\n        X\nXXXXXXXX\n") 
	in
	end

(* ****** ****** *)


implement
print_digit_6() = 
	let
		val () = println!("XXXXXXXX\nX        \nX        \nX        \nXXXXXXXX\nX       X\nX       X\nX       X\nXXXXXXXX\n") 
	in
	end

(* ****** ****** *)

fun solve$base(n: int): int = n

fun solve$base_test(n: int): bool = 
	if n > 2 
		then false
		else true

fun solve$recarg(n: int): int = n/2

fun solve$assmbl_aft(n: int, res: int): int = 2 * res + n

fun solve(n: int): int = 
	if solve$base_test(n)
		then solve$base(n)
		else 
			let
				val res = solve(solve$recarg(n))
			in
  				solve$assmbl_aft(n, res)
			end

implement MS(n) = solve(n)
//	if n < 2
//		then 1
//		else 2 * MS(n/2) + n

(* ****** ****** *)
//
// HX-2017-01-29:
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
val () = show_triangle(3)
val () = show_triangle(5)
//

val () = print_digit_3() // you need to change ?
val () = print_digit_6() // you need to change ? 

//
val () = println!("MS(1000) = ", MS(1000))
val () = println!("MS(10000) = ", MS(10000))
val () = println!("MS(100000) = ", MS(100000))
val () = println!("MS(1000000) = ", MS(1000000))
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [assign02_sol.dats] *)
