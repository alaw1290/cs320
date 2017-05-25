#include "share/atspre_staload.hats"

datatype list (a:t@ype) = 
| ListCons of (a, list a)
| ListNil  of ()

#define ::  ListCons 
#define nil ListNil

typedef cont (a:t@ype) = a -<cloref1> void

extern fun {a,b:t@ype} foldl (list a, b, (b, a) -<cloref1> b): b
extern fun {a,b:t@ype} foldr (list a, (a, b) -<cloref1> b, b): b
extern fun {a,b:t@ype} foldlk (list a, b, (b, a, cont b) -<cloref1> void, cont b): void 
extern fun {a,b:t@ype} foldrk (list a, (a, b, cont b) -<cloref1> void, b, cont b): void 

implement {a,b} foldl (xs, sink, f) = 
	case+ xs of 
	| x :: xs => foldl (xs, f (sink, x), f)
	| nil ()  => sink 

implement {a,b} foldr (xs, f, sink) = 
	case+ xs of 
	| x :: xs => f (x, foldr (xs, f, sink))
	| nil ()  => sink

implement {a,b} foldlk (xs, sink, fk, kont) = 
	case+ xs of 
	| x :: xs => fk (sink, x, lam newsink => foldlk (xs, newsink, fk, kont))
	| nil ()  => kont sink

implement {a,b} foldrk (xs, fk, sink, kont) = 
	case+ xs of 
	| x :: xs => foldrk (xs, fk, sink, lam ys => fk (x, ys, kont))
	| nil () => kont sink


extern fun {a,b:t@ype} map (list a, a -<cloref1> b): list b
extern fun {a,b:t@ype} mapk (list a, (a, cont b) -<cloref1> void, cont (list b)): void

implement {a,b} map (xs, f) = foldr (xs, lam (x, ys) => (f x) :: ys, nil())
implement {a,b} mapk (xs, fk, kont) = foldrk (xs, lam (x, ys, kont) => fk (x, lam y => kont (y :: ys)), nil(), kont)


(*
	Please define and implement the following functions on lists
	Whenever you could, please use foldlk/foldrk to imeplement them

	1) filterk => CPS filter
	2) foreachk => CPS foreach
	3) lengthk => CPS length
	4) snock => CPS snoc, the reverse of cons, which is, append a single element at the end
	5) reversek => CPS reverse
*)

extern fun {a:t@ype} filterk (list a, (a, cont bool) -<cloref1> void, cont (list a)): void 
extern fun {a:t@ype} foreachk (list a, (a, cont void) -<cloref1> void, cont void): void
extern fun {a:t@ype} lengthk (list a, cont int): void
extern fun {a:t@ype} snock (list a, a, cont (list a)): void 
extern fun {a:t@ype} reversek (list a, cont (list a)): void

implement {a} filterk (xs, fk, kont) = 
	foldrk (xs, lam (x, ys, kont) => fk (x, lam test => if test then kont (x :: ys) else kont ys), nil (), kont)

implement {a} foreachk (xs, fk, kont) = 
	foldlk (xs, (), lam (_, x, kont) => fk (x, kont), kont)

implement {a} lengthk (xs, kont) = 
	foldlk<a,int> (xs, 0, lam (l, _, kont) => kont (l + 1), kont)

implement {a} snock (xs, e, kont) = 
	foldrk (xs, lam (x, xs, kont) => kont (x :: xs), e :: nil(), kont)

implement {a} reversek (xs, kont) = 
	foldlk (xs, nil (), lam (sx, x, kont) => kont (x :: sx), kont)

extern fun show (list int): void

implement show (xs) = let 
	val _ = foldlk<int,int> (xs, 0, lam (_, x, kont) => kont (print_int x; print_string "::"; 0), lam x => ())
in 
	print_string "nil\n"
end

implement main0 () = () where {
	val xs = 1 :: 2 :: 3 :: 4 :: 5 :: nil()
	val _ = show xs
	val () = mapk<int,int> (xs, lam (x, kont) => kont (x * 2), lam ys => show ys)
	val () = filterk<int> (xs, lam (x, kont) => kont (x mod 2 = 0), lam ys => show ys)
	val () = reversek<int> (xs, lam sx => show sx)
}
