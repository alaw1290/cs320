(* ****** ****** *)
//
// HX-2014-11-04:
//
// Drawing Sierpinski carpet
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
#define
MYMODULES_targetloc "./../../mymodules"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload
"{$MYMODULES}/mydraw/SATS/mydraw.sats"
//
#include
"{$MYMODULES}/mydraw/DATS/mydraw.dats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)

fun
mid_ppp (
  p1: point, p2: point
) : point = p1 + (p2 - p1)/3.0
  
(* ****** ****** *)
//
extern
fun{}
draw4p
(
p1: point, p2: point, p3: point, p4: point
) : void // end of [draw4p]
//  
extern
fun{}
draw_Sierpinski
(
  p1: point, p2: point, p3: point, p4: point, n: int
) : void = "mac#" // end of [draw_Sierpinski]
//

implement {}
draw_Sierpinski(p1,p2,p3,p4,n) = let 
  macdef mid = mid_ppp
in
  if n >= 1 then let
    val p12 = (p1 \mid p2)
    val p21 = (p2 \mid p1)
    val p23 = (p2 \mid p3)
    val p32 = (p3 \mid p2)
    val p34 = (p3 \mid p4)
    val p43 = (p4 \mid p3)
    val p41 = (p4 \mid p1)
    val p14 = (p1 \mid p4)

    val pa = (p12 \mid p43)
    val pb = (p21 \mid p34)
    val pc = (p34 \mid p21)
    val pd = (p43 \mid p12)

    val () = draw4p(pa,pb,pc,pd)
    val () = draw_Sierpinski (p1,p12,pa,p14,n-1)
    val () = draw_Sierpinski (p12,p21,pb,pa,n-1)
    val () = draw_Sierpinski (p21,p2,p23,pb,n-1)
    val () = draw_Sierpinski (pb,p23,p32,pc,n-1)
    val () = draw_Sierpinski (pc,p32,p3,p34,n-1)
    val () = draw_Sierpinski (pd,pc,p34,p43,n-1)
    val () = draw_Sierpinski (p41,pd,p43,p4,n-1)
    val () = draw_Sierpinski (p14,pa,pd,p41,n-1)

  in
  end
end
    
(* ****** ****** *)

extern
fun
draw_Sierpinski_canvas
(
  ctx: canvas2d
, x1: double, y1: double
, x2: double, y2: double
, x3: double, y3: double
, x4: double, y4: double
, r0: double, g0: double, b0: double
, depth: int
) : void = "mac#" // end-of-function

(* ****** ****** *)

implement
draw_Sierpinski_canvas
(
  ctx
, x1, y1
, x2, y2
, x3, y3
, x4, y4
, r0, g0, b0
, depth // depth for recursion
) = let
//
implement
draw4p<>
(
  p1, p2, p3, p4
) = let
//
val pf = ctx.save()
val () = ctx.beginPath()
val () = ctx.moveTo (p1.x(), p1.y())
val () = ctx.lineTo (p2.x(), p2.y())
val () = ctx.lineTo (p3.x(), p3.y())
val () = ctx.lineTo (p4.x(), p4.y())
val () = ctx.closePath()
val () = ctx.fill()
val () = ctx.restore (pf.0 | (*none*))
//
in
  // nothing
end // end of [draw4p]
//
val p1 = point_make (x1, y1)
val p2 = point_make (x2, y2)
val p3 = point_make (x3, y3)
val p4 = point_make (x4, y4)
//
macdef
floor(x) = JSmath_floor(,(x))
//
val r1 =
  floor(255 * r0)
and g1 =
  floor(255 * g0)
and b1 =
  floor(255 * b0)
val r1 = String(r1)
and g1 = String(g1)
and b1 = String(b1)
//
val ((*void*)) =
ctx.fillStyle("rgb("+r1+","+g1+","+b1+")")
//
in
  draw_Sierpinski(p1, p2, p3, p4, depth)
end // end of [draw_Sierpinski_canvas]

(* ****** ****** *)

%{$
//
var
canvas =
document.getElementById
(
"Patsoptaas-Evaluate-canvas"
);
var ctx2d = canvas.getContext( '2d' );
//
var N = 5;
//
function
draw_Sierpinski_canvas_show
(
theDepth
)
{
//
var w = canvas.width
var h = canvas.height
var wh = Math.min (w, h)
var wh2 = 0.88 * wh
//
var depth = (theDepth%N)+1
//
ctx2d.save();
ctx2d.translate((w-wh2)/2, (h-wh2)/2);
//
ctx2d.beginPath();
ctx2d.moveTo(0, 0);
ctx2d.lineTo(0, wh2);
ctx2d.lineTo(wh2, wh2);
ctx2d.lineTo(wh2, 0);
ctx2d.closePath();
ctx2d.fillStyle = "#0000ff";
ctx2d.fill(/*void*/);
//
draw_Sierpinski_canvas
(
  ctx2d, 0, 0, 0, wh2, wh2, wh2, wh2, 0, 1.0, 1.0, 0.0, depth
); // draw_Sierpinski_canvas
//
ctx2d.restore();
//
return;
//
} // end of [draw_Sierpinski_canvas_show]
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Sierpinski_carpet.dats] *)
