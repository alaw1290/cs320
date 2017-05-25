(* ****** ****** *)


#ifdef
STATESTREAM_EMBEDDED
#then
#else
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}\
/SATS/HTML/canvas-2d/canvas2d.sats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
extern
fun
theCanvas_get
  ((*void*)): canvas = "mac#"
extern
fun
theCanvas_ctx2d_get
  ((*void*)): canvas2d = "mac#"
//
(* ****** ****** *)
//

abst@ype state_t0ype = ptr
//
typedef state = state_t0ype
typedef states = stream(state)
//
#endif // end of ifndef(EMBEDDED)

(* ****** ****** *)
//

datatype
marked =
	| Mark of (int) 
	| Elem of (list0(int))

assume
state_t0ype = marked
//
(* ****** ****** *)
//
fun{a:t0p}
stringize_list0
  (xs: list0(INV(a))): string =
(
list0_foldright
  (xs, lam(x, res) => String(x) + res, "")
)
//
(* ****** ****** *)

#define N 8
#define W 600
#define H 420
#define W2 300.0
#define H2 210.0
#define WH 400

(* ****** ****** *)
//
#define PI 3.1415926535898
//
(* ****** ****** *)
//
extern
fun
draw_board
(ctx: canvas2d): void
//
implement
draw_board(ctx) = let
//
val BN = 1.0*WH/N
val x0 = 1.0*(W-WH)/2
val y0 = 1.0*(H-WH)/2
//
fun
auxrow
(
  nx: int
, ny: int
, c1: string, c2: string
) : void =
if
(nx < N)
then let
//
val () = ctx.fillStyle(c1)
//
val () = ctx.beginPath()
val () = ctx.rect(x0+nx*BN, y0+ny*BN, BN, BN)
val () = ctx.closePath()
//
val () = ctx.fill((*void*))
//
in
  auxrow(nx+1, ny, c2, c1)
end (* end of [then] *)
//
fun
auxrows
(
  ny: int
, c1: string, c2: string
) : void =
if
(ny < N)
then let
//
val () =
  auxrow(0, ny, c1, c2)
//
in
  auxrows(ny+1, c2, c1)
end // end of [then]
//
val c1 = "#7f7f7f" and c2 = "#efefef"
//
in
  auxrows(0(*ny*), c1, c2)
end // end of [draw_board]
//
(* ****** ****** *)
//
extern
fun
draw_queen
(
  ctx: canvas2d, y0: double, n: int
) : void
//
implement
draw_queen
(ctx, y0, n) = let
//
val BN = 1.0*WH/8
//
val x0 = 1.0*(W-WH)/2
//
val yc = y0 + BN/2
val xc = x0 + n*BN + BN/2
//
val RAD = 0.90 * BN/2
//
val () =
ctx.fillStyle("#000000")
//
val () = ctx.beginPath()
val () = ctx.arc(xc, yc, RAD, 0.0, 2*PI, true)
val () = ctx.closePath()
//
val () = ctx.fill((*void*))
//
in
  // nothing
end // end of [draw_queen]

(* ****** ****** *)
//

extern
fun
draw_queens(ctx: canvas2d, ns: list0(int)) : void // end of [draw_queens]
//
implement
draw_queens(ctx, ns) = 
	let
		val BN = 1.0*WH/N
		val y0 = 1.0*(H-WH)/2
		fun auxlst(y0: double, ns: list0(int)) : void =
			(case+ ns of
				| list0_nil() => ()
				| list0_cons(n, ns) => (draw_queen(ctx, y0, n); auxlst(y0+BN, ns))
			)
//
	in
		auxlst(y0, ns)
//
//		if length(ns) = N
//			then (
//				auxlst(y0, ns); 
//				alert(string_append("solution #", String(solnum))) 
//				) 
//			else auxlst(y0, ns)
//
end // end of [draw_queens]

(* ****** ****** *)

extern
fun
theState_show(state): void = "mac#"
//
implement
theState_show(state) = let
//
	val ctx = theCanvas_ctx2d_get()
//
//	val () = ctx.clearRect(0, 0, W, H)
//	val () = draw_board(ctx)
//	val () = draw_queens(ctx, state.1, state.0)
//
in
  case+ state of
  	| Mark(n) => alert(string_append("solution #", String(n))) 
  	| Elem(x) => (ctx.clearRect(0, 0, W, H); draw_board(ctx); draw_queens(ctx, reverse(x)))
end // end of [theState_show]
//
(* ****** ****** *)
//
extern
fun
QueenPuzzle
(
// implemented elsewhere
) : stream(list0(int)) = "mac#"
//
(* ****** ****** *)
//
extern
fun
theStateStream_gen(): states = "mac#"
//
(* ****** ****** *)
//

implement
theStateStream_gen((*void*)) = aux(QueenPuzzle(), 1) where {
	fun aux(puzzle: stream(list0(int)), n:int): stream(marked) = $delay(
		case+ !puzzle of
			| stream_nil() => stream_nil()
			| stream_cons(x, xs) => if length(x) = N
										then stream_cons(Elem(x), $delay(stream_cons(Mark(n), aux(xs, n+1))))
										else stream_cons(Elem(x), aux(xs, n))
		)
}


//implement
//theStateStream_gen((*void*)) = aux(QueenPuzzle(), 1) where {
//	fun aux(puzzle: stream(list0(int)), n:int): stream(@(int,list0(int))) = $delay(
//		case+ !puzzle of
//			| stream_nil() => stream_nil()
//			| stream_cons(x, xs) => if length(x) = N
//										then stream_cons(@(n,x), aux(xs, n+1))
//										else stream_cons(@(n,x), aux(xs, n))
//		)
//}

//implement
//theStateStream_gen((*void*)) = let
//	val qp = QueenPuzzle()
//	fun aux(puzzle: stream(list0(int)), n: int): stream(list0(int)) = $delay(
//		let 
//			val- stream_cons(p,ps) = !puzzle
//			val res = list0_cons(p,n)
//		in
//			if length(p) = N 
//				then stream_cons(res, aux(ps, n+1)) 
//				else stream_cons(p, aux(ps, n))
//		end
//		case+ !puzzle of
//			| stream_nil() => stream_nil()
//			| stream_cons(x, xs) => if length(x) = N
//										then stream_cons(list0_cons(x,n), aux(xs, n+1))
//										else stream_cons(x, aux(xs, n))
//		)
//	in
//		aux(qp,1)
//	end

//
(* ****** ****** *)

(* end of [theStateStream.dats] *)
