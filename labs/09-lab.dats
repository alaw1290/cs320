
#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"


#define ::  stream_cons 
#define nil stream_nil
#define map stream_map_cloref

extern fun {a:t@ype} stream_alter (stream a, stream a): stream a
extern fun {a:t@ype} stream_enum (stream (stream a)): stream a


implement {a} stream_alter (xs, ys) = 
	case+ !xs of 
	| nil () => ys 
	| x :: xs => $delay (x :: stream_alter (ys, xs))

implement {a} stream_enum (xss) = let 
	val- xs::xss = !xss 
	val- x::xs = !xs
in 
	$delay (x :: stream_alter (xs, stream_enum xss))
end


typedef intpair = (int, int)


(*
00, 01, 02, 03, 04, ...
10, 11, 12, 13, 14, ...
20, 21, 22, 23, 24, ...
30, 31, 32, 33, 34, ...
40, 41, 42, 43, 44, ...
.
.
.
*)
extern fun from (int, int): stream (stream intpair)
implement from (x, y) = let 
	fun gen (n: int): stream int = $delay (n :: gen (n+1))
in 
	$delay ((map (gen y, lam y => (x, y))) :: from (x+1, y))
end


extern fun show (stream intpair, int): void 
implement show (xs, n) = 
	if n <= 0
	then ()
	else case+ !xs of 
		 | (x,y) :: xs => (println! (x, ",", y); show (xs, n-1))
		 | nil ()  => ()

implement main0 () = () where {
	val xys = from (0, 0)
	val _ = show (stream_enum xys, 10)
}