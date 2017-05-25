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
//
// HX: placeholder
//
implement
Enigma_create () =
  $UN.cast{Enigma}(the_null_ptr)
//
(* ****** ****** *)
//
// HX: placeholder
//
implement
Enigma_encode(M, letter) = letter
//
(* ****** ****** *)

(* end of [Enigma.dats] *)
