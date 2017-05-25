(* ****** ****** *)
(*
** Doublets is a word game ...
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

staload "./Doublets.sats"

(* ****** ****** *)

assume word = list0(char)

(* ****** ****** *)
//
implement
string2word(str) = string_explode(str)
//
(* ****** ****** *)
//
implement
eq_word_word(w1, w2) =
  list0_equal(w1, w2, lam(c1, c2) => (c1=c2))
//
(* ****** ****** *)
//
implement
print_word(w) = fprint_word(stdout_ref, w)
implement
fprint_word(out, w) = fprint_list0_sep(out, w, "")
//
(* ****** ****** *)
//
fun
word_is_legal(cs: word): bool =
  theWords_map_search(string_implode(cs))
//
(* ****** ****** *)

(*
//
// HX: Please implement
// the function [word_get_neighbors]
//
*)

implement
word_get_neighbors(w0) = aux(w0, w0, list0_nil(), list0_nil()) where {
	fun aux(w0:list0(char), original_w0:list0(char), w0_head:list0(char), res:list0(word)): list0(word) = 
		case- w0 of
			| list0_nil() => res
			| list0_cons(c,cs) => ( 
				let
					val new_w0 = list0_cons(c+1, cs)
					val new_w0 = list0_append(w0_head, new_w0) 
					val () = print_word(new_w0)
				in 
					if eq_word_word(new_w0,original_w0)
						then aux(cs, original_w0, list0_append(w0_head,list0_cons(c,list0_nil())), res)
						else if word_is_legal(new_w0)
								then aux(new_w0, original_w0, w0_head, list0_cons(new_w0, res))
								else aux(new_w0, original_w0, w0_head, res)
				end
				)
}




(* ****** ****** *)

(* end of [Doublets_word.dats] *)
