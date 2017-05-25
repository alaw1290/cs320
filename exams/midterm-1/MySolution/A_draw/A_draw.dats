(*
** Midterm-1:
** A_draw: 10 points
patscc -o A_draw A_draw.dats 

*)

(* ****** ****** *)
//
staload
"./../../midterm-1.dats"
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"

fun level_looper(nspace_head:int,nstar:int,nspace_tail:int) : void = 
	if nspace_head > 0
		then (print!(" "); 
			level_looper(nspace_head - 1,nstar,nspace_tail))
		else
			if nstar > 0 
				then (print!("*"); 
					level_looper(nspace_head,nstar - 1,nspace_tail))
				else
					if nspace_tail > 0
						then (print!(" "); 
							level_looper(nspace_head,nstar,nspace_tail - 1))		
						else print!("\n") 

fun construct_A_level(nspace_head:int, num_blanks:int, nspace_tail:int) : void = 
	if nspace_head > 0
		then (print!(" "); construct_A_level(nspace_head - 1,num_blanks,nspace_tail))
		else
			if nspace_head = 0 
				then (print!("*"); construct_A_level(nspace_head - 1,num_blanks,nspace_tail))
				else
					if num_blanks > 0 
						then (print!(" "); 
							construct_A_level(nspace_head,num_blanks - 1,nspace_tail))
						else
							if num_blanks = 0 
								then (print!("*"); construct_A_level(nspace_head,num_blanks - 1,nspace_tail))
								else
									if nspace_tail > 0
										then (print!(" "); 
											construct_A_level(nspace_head,num_blanks,nspace_tail - 1))		
										else print!("\n") 


fun A_bottom (level:int, width:int, n:int): void =
		let
			// # blanks at this level
			val num_blanks = 2 * level - 1
			// # spaces before and after stars
			val buffer = ((width - num_blanks) / 2)
		in
			if (level <= n) 
				then
					let
						val () = construct_A_level(buffer, num_blanks, buffer)
					in
						A_bottom(level + 1, width, n)
					end
				else
					(println!(""))
							
		end

fun A_top (level:int, width:int, n:int): void =
		let
			// # blanks at this level
			val num_blanks = 2 * level - 3
			// # spaces before and after stars
			val buffer = ((width - num_blanks) / 2)
		in
			if level = 1 
				then (level_looper(buffer,1,buffer);A_top(level + 1, width, n))
				else
					if (level <= n) 
						then
							let
								val () = construct_A_level(buffer, num_blanks, buffer)
							in
								A_top(level + 1, width, n)
							end
						else
							let
								val () = level_looper(buffer,width/2+2,buffer)
								val () = A_bottom(level,width,2*n)
							in
							end
							
		end


implement
A_draw(n) = A_top(1, n * 4  - 1,n)
	



(* ****** ****** *)

implement
main0 () =
{
//
val () =
println! ("Testing for A_draw")
//
val () = A_draw(1)
val () = A_draw(2)
val () = A_draw(3)
val () = A_draw(4)
val () = A_draw(5)
val () = A_draw(6)
val () = A_draw(7)
val () = A_draw(10)
val () = A_draw(11)
val () = A_draw(12)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [A_draw.dats] *)
