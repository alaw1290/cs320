(*
// HX-2014-04:
// an implementation of ENIGMA
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./Enigma.sats"

(* ****** ****** *)
(*
//
// HX: placeholder
//
implement
Enigma_create() =
  $UN.cast{Enigma}(the_null_ptr)
//
*)
(* ****** ****** *)
(*
//
// HX: placeholder
//
implement
Enigma_encode(M, letter) = letter
//
*)
(* ****** ****** *)

local

assume
lettermap = array0(letter)

in (* in-of-local *)

implement
lettermap_create_pairs
  (ccs) = let
//
fun loop
(
  map: lettermap, ccs: list0(letter2)
) : void =
(
  case+ ccs of
  | nil0((*void*)) => ()
  | cons0(cc, ccs) => let
      val i = cc.0
      val () = map[i] := cc.1 in loop(map, ccs)
    end // end of [cons0]
)
//
val map =
array0_make_elt<letter>(i2sz(N), 0)
//
in
  loop (map, ccs); map
end // end of [lettermap_create_pairs]
                  
(* ****** ****** *)

implement
lettermap_create_inverse(map) = 
  let
    fun loop (out : lettermap, i : letter): void = 
      if letter < N
        then (out[ lettermap_encode(map, i)] := i, loop (out, i+1))
    val out = array0_make_elt<letter> (i2sz N, 0)
  in
    loop(out,0)
    out
  end

(* ****** ****** *)

implement lettermap_encode(map, c) = map[c]

(* ****** ****** *)
                    
end // end of [local]

(* ****** ****** *)

assume reflector = lettermap
assume plugboard = lettermap
assume rotor     = '(lettermap, letter, letter)
typedef EnigmaState = '(rotorseq, reflector, plugboard)
assume Enigma    = ref EnigmaState

implement Enigma_create () = let
  in
  end

implement Enigma_encode (enigma, letter) = let 
    fun applyEnigma(e:EnigmaState, i: letter): EnigmaState = 
    val () = enigma := applyEnigma(....,....)
  in
  end

(* end of [Enigma.dats] *)
