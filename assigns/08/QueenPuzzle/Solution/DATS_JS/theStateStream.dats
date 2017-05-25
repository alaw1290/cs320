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

datatype state =
  | Mark of int
  | Board of list0(int)

(* ****** ****** *)
//
assume
state_t0ype = state
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
draw_queens
(
  ctx: canvas2d, ns: list0(int)
) : void // end of [draw_queens]
//
implement
draw_queens
(ctx, ns) = let
//
val BN = 1.0*WH/N
val y0 = 1.0*(H-WH)/2
//
fun
auxlst
(
y0: double, ns: list0(int)
) : void =
(
case+ ns of
| list0_nil() => ()
| list0_cons(n, ns) =>
  (draw_queen(ctx, y0, n); auxlst(y0+BN, ns))
)
//
in
//
  auxlst(y0, ns)
//
end // end of [draw_queens]

(* ****** ****** *)

extern
fun
theState_show(state): void = "mac#"
//
implement
theState_show
  (state) = let
//
val
ctx =
theCanvas_ctx2d_get()
//
in
//
case+ state of
| Mark(n) =>
  {
    val
    () = alert
    (
      "Solution #"+String(n)+" is found!"
    ) (*alert*)
  }
| Board(ns) =>
  {
//
    val () =
    ctx.clearRect(0, 0, W, H)
//
    val () = draw_board(ctx)
    val () = draw_queens(ctx, reverse(ns))
//
  }
//
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
extern
fun
theStateStream_gen(): states = "mac#"
//
(* ****** ****** *)
//
implement
theStateStream_gen
  ((*void*)) = let
//
fun
auxmark
(
nsol: int
,
nss: stream(list0(int))
) : states = $delay
(
case+ !nss of
| stream_nil() =>
  stream_nil()
| stream_cons(ns, nss) =>
  if length(ns) < N
    then
    stream_cons(Board(ns), auxmark(nsol, nss))
    else
    stream_cons(Board(ns), $delay(stream_cons(Mark(nsol), auxmark(nsol+1, nss))))
  // end of [if]
)
//
in
  auxmark(1, QueenPuzzle())
end // end of [theStateStream_gen]
//
(* ****** ****** *)

(* end of [theStateStream.dats] *)
