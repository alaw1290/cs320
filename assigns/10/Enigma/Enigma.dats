(*
// HX-2014-04:
// an implementation of ENIGMA
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./Enigma.sats"

(* ****** ****** *)
//
// HX: placeholder
//
implement
Enigma_create() =
  $UN.cast{Enigma}(the_null_ptr)
//
(* ****** ****** *)
//
// HX: placeholder
//
implement
Enigma_encode (M, letter) = letter
//
(* ****** ****** *)

(* end of [Enigma.dats] *)
