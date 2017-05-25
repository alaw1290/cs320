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
//
#staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

typedef letter = int

(* ****** ****** *)

abstype Enigma = ptr

(* ****** ****** *)

abstype rotor = ptr
typedef rotorseq = list0(rotor)

(* ****** ****** *)

abstype plugboard = ptr

(* ****** ****** *)

abstype reflector = ptr

(* ****** ****** *)

fun Enigma_create (): Enigma
fun Enigma_encode (x: Enigma, n: letter): letter

(* ****** ****** *)

fun rotor_encode (x: rotor, n: letter): letter
fun rotor_decode (x: rotor, n: letter): letter

(* ****** ****** *)

fun rotorseq_encode (xs: rotorseq, n: letter): letter
fun rotorseq_decode (xs: rotorseq, n: letter): letter

(* ****** ****** *)

fun reflector_encode (x: reflector, n: letter): letter
fun reflector_decode (x: reflector, n: letter): letter

(* ****** ****** *)

fun plugboard_encode (x: plugboard, n: letter): letter
fun plugboard_decode (x: plugboard, n: letter): letter

(* ****** ****** *)

(* end of [Enigma.sats] *)
