#include "share/atspre_staload.hats"
(*
http://ats-lang.sourceforge.net/LIBRARY/prelude/SATS/DOCUGEN/HTML/stream.html

f (x) = x + x 
e = (1 + 1)
eager: f (e) = f (1+1) = f(2) = 2 + 2 = 4
lazy:  f (e) = e + e = (1+1) + (1+1) = 2 + 2 = 4

type constructor: lazy (?)
keywords: 
    - $delay: a -> lazy (a)
    - !: lazy (a) -> a
*)

datatype stream_t (a:t@ype) = 
| StreamCons of (a, lazy (stream_t a))
| StreamNil of ()

typedef stream (a:t@ype) = lazy (stream_t a)


#define ::  StreamCons
#define nil StreamNil

extern fun from (int): stream int 
implement from (n) = $delay (n :: from (n+1))

extern fun {a:t@ype} filter (stream a, a -<cloref1> bool): stream a
implement {a} filter (xs, p) =
    case+ !xs of 
    | nil ()  => $delay (nil ())
    | x :: xs => if p x then $delay (x :: filter (xs, p)) else filter (xs, p)

extern fun sieve (stream int): stream int 
implement sieve (xs) = $delay (
    case+ !xs of 
    | nil () =>  nil ()
    | x :: xs => x :: sieve (filter (xs, lam i => i mod x != 0))
)

extern fun primes (): stream int 
implement primes () = sieve (from 2)

extern fun {a:t@ype} take (stream a, int): stream a
implement {a} take (xs, n) = 
    if n <= 0 then $delay (nil ()) else 
    case+ !xs of 
    | nil () => $delay (nil ())
    | x :: xs => $delay (x :: take (xs, n-1))

extern fun show (stream int): void 
implement show (xs) = 
    case+ !xs of 
    | nil () => ()
    | x :: xs => (print_int x; print_newline (); show xs)

implement main0 () = show (take (primes (), 100))
