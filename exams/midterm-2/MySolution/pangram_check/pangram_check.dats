(*
** pangram_check: 10 points
*)

(* ****** ****** *)

#include "./../../midterm-2.dats"

(* ****** ****** *)


#include
"share/atspre_staload.hats"

#include
"share/HATS\
/atspre_staload_libats_ML.hats"

// patscc -DATS_MEMALLOC_LIBC -o pangram_check pangram_check.dats

// print(char2int0(c)); print " "
// a-z is 97-122
// A-Z is 65-90

extern 
fun loop(text:list0(char), i:int): bool

implement
loop(text,i) = 
	case+ text of
		| list0_nil() => false
		| list0_cons(c,cs) => 
				if ((char2int0(c) - 97) = i || (char2int0(c) - 65) = i) 
					then true 
					else loop(cs,i)


implement
pangram_check(text) =
	let	
		fun pc_aux(text:list0(char),i:int): bool =
			if i = 25 
				then true
				else if loop(text,i) then pc_aux(text,i+1) else false

		val text = string_explode(text)
	in
		pc_aux(text,0)
	end

(* ****** ****** *)


implement
main0() = () where
{
val () = println!("1: abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
val-true = pangram_check("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

val () = println!("2: The Quick Brown Fox jumps over the Lazy Dog.")
val-true = pangram_check("The Quick Brown Fox jumps over the Lazy Dog.")

val () = println!("3: This is almost a pangram sentence: abcdefghijklmnopqrstuvwxy")
val-false = pangram_check("nope")

val () = println!("4: This is not a pangram sentence.")
val-false = pangram_check("This is not a pangram sentence.")

} (* end of [main0] *)

(* ****** ****** *)

(* end of [pangram_check.dats] *)
