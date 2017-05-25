(*
// HX-2011-08:
// an ENIGMA implementation
*)
(* ****** ****** *)
(*
// HX-2014-04: ported to ATS2
*)
(* ****** ****** *)
(*
// HX-2017-04: Some adaptation...
*)
(* ****** ****** *)

#define
ATS_PACKNAME "Enigma"

(* ****** ****** *)

// the number 
#define N 26 // of letters

(* ****** ****** *)

#include "./../Enigma.sats"

(* ****** ****** *)
//
// HX-2017-04-26:
// Please feel free to add whatever you need
//
(* ****** ****** *)

typedef letter2 = $tup(letter, letter)

(* ****** ****** *)

abstype lettermap = ptr

(* ****** ****** *)

fun lettermap_create_pairs (list0(letter2)): lettermap

(* ****** ****** *)

fun lettermap_create_inverse (map: lettermap): lettermap

(* ****** ****** *)

fun lettermap_encode (map: lettermap, x: letter): letter

(* ****** ****** *)

(* end of [Enigma.sats] *)
