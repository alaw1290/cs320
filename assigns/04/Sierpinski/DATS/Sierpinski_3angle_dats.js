/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2017-2-22: 19h:25m
**
*/

function
mid_ppp_23(arg0, arg1)
{
//
// knd = 0
  var tmpret87
  var tmp100
  var tmp110
  var tmplab, tmplab_js
//
  // __patsflab_mid_ppp_23
  tmp110 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__sub_point_point__9__1(arg1, arg0);
  tmp100 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__div_vector_scalar__15__1(tmp110, 2.0);
  tmpret87 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__add_point_vector__10__1(arg0, tmp100);
  return tmpret87;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__add_point_vector__10__1(arg0, arg1)
{
//
// knd = 0
  var tmpret28__1
  var tmp29__1
  var tmp30__1
  var tmp31__1
  var tmp32__1
  var tmp33__1
  var tmp34__1
  var tmplab, tmplab_js
//
  // __patsflab_add_point_vector
  tmp30__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__1(arg0);
  tmp31__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_x__6__1(arg1);
  tmp29__1 = ats2jspre_add_double_double(tmp30__1, tmp31__1);
  tmp33__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__1(arg0);
  tmp34__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_y__7__1(arg1);
  tmp32__1 = ats2jspre_add_double_double(tmp33__1, tmp34__1);
  tmpret28__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__1(tmp29__1, tmp32__1);
  return tmpret28__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__1(arg0)
{
//
// knd = 0
  var tmpret1__1
  var tmplab, tmplab_js
//
  // __patsflab_point_get_x
  tmpret1__1 = arg0[0];
  return tmpret1__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_x__6__1(arg0)
{
//
// knd = 0
  var tmpret12__1
  var tmplab, tmplab_js
//
  // __patsflab_vector_get_x
  tmpret12__1 = arg0[0];
  return tmpret12__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__1(arg0)
{
//
// knd = 0
  var tmpret2__1
  var tmplab, tmplab_js
//
  // __patsflab_point_get_y
  tmpret2__1 = arg0[1];
  return tmpret2__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_y__7__1(arg0)
{
//
// knd = 0
  var tmpret13__1
  var tmplab, tmplab_js
//
  // __patsflab_vector_get_y
  tmpret13__1 = arg0[1];
  return tmpret13__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__1(arg0, arg1)
{
//
// knd = 0
  var tmpret0__1
  var tmplab, tmplab_js
//
  // __patsflab_point_make
  tmpret0__1 = [arg0, arg1];
  return tmpret0__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__div_vector_scalar__15__1(arg0, arg1)
{
//
// knd = 0
  var tmpret61__1
  var tmp62__1
  var tmp63__1
  var tmp64__1
  var tmp65__1
  var tmp66__1
  var tmplab, tmplab_js
//
  // __patsflab_div_vector_scalar
  tmp62__1 = ats2jspre_div_double_double(1.0, arg1);
  tmp64__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_x__6__2(arg0);
  tmp63__1 = ats2jspre_mul_double_double(tmp62__1, tmp64__1);
  tmp66__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_y__7__2(arg0);
  tmp65__1 = ats2jspre_mul_double_double(tmp62__1, tmp66__1);
  tmpret61__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_make__5__1(tmp63__1, tmp65__1);
  return tmpret61__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_x__6__2(arg0)
{
//
// knd = 0
  var tmpret12__2
  var tmplab, tmplab_js
//
  // __patsflab_vector_get_x
  tmpret12__2 = arg0[0];
  return tmpret12__2;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_get_y__7__2(arg0)
{
//
// knd = 0
  var tmpret13__2
  var tmplab, tmplab_js
//
  // __patsflab_vector_get_y
  tmpret13__2 = arg0[1];
  return tmpret13__2;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_make__5__1(arg0, arg1)
{
//
// knd = 0
  var tmpret11__1
  var tmplab, tmplab_js
//
  // __patsflab_vector_make
  tmpret11__1 = [arg0, arg1];
  return tmpret11__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__sub_point_point__9__1(arg0, arg1)
{
//
// knd = 0
  var tmpret21__1
  var tmp22__1
  var tmp23__1
  var tmp24__1
  var tmp25__1
  var tmp26__1
  var tmp27__1
  var tmplab, tmplab_js
//
  // __patsflab_sub_point_point
  tmp23__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__2(arg0);
  tmp24__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__3(arg1);
  tmp22__1 = ats2jspre_sub_double_double(tmp23__1, tmp24__1);
  tmp26__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__2(arg0);
  tmp27__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__3(arg1);
  tmp25__1 = ats2jspre_sub_double_double(tmp26__1, tmp27__1);
  tmpret21__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_make__5__2(tmp22__1, tmp25__1);
  return tmpret21__1;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__2(arg0)
{
//
// knd = 0
  var tmpret1__2
  var tmplab, tmplab_js
//
  // __patsflab_point_get_x
  tmpret1__2 = arg0[0];
  return tmpret1__2;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__3(arg0)
{
//
// knd = 0
  var tmpret1__3
  var tmplab, tmplab_js
//
  // __patsflab_point_get_x
  tmpret1__3 = arg0[0];
  return tmpret1__3;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__2(arg0)
{
//
// knd = 0
  var tmpret2__2
  var tmplab, tmplab_js
//
  // __patsflab_point_get_y
  tmpret2__2 = arg0[1];
  return tmpret2__2;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__3(arg0)
{
//
// knd = 0
  var tmpret2__3
  var tmplab, tmplab_js
//
  // __patsflab_point_get_y
  tmpret2__3 = arg0[1];
  return tmpret2__3;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__vector_make__5__2(arg0, arg1)
{
//
// knd = 0
  var tmpret11__2
  var tmplab, tmplab_js
//
  // __patsflab_vector_make
  tmpret11__2 = [arg0, arg1];
  return tmpret11__2;
} // end-of-function


function
draw_Sierpinski_canvas(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10)
{
//
// knd = 0
  var tmp149
  var tmp151
  var tmp153
  var tmp155
  var tmp156
  var tmp157
  var tmp158
  var tmp159
  var tmp160
  var tmp161
  var tmp162
  var tmp163
  var tmp165
  var tmp166
  var tmp167
  var tmp168
  var tmp169
  var tmp170
  var tmplab, tmplab_js
//
  // __patsflab_draw_Sierpinski_canvas
  tmp149 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__2(arg1, arg2);
  tmp151 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__3(arg3, arg4);
  tmp153 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__4(arg5, arg6);
  tmp156 = ats2jspre_mul_int_double(255, arg7);
  tmp155 = ats2jspre_JSmath_floor(tmp156);
  tmp158 = ats2jspre_mul_int_double(255, arg8);
  tmp157 = ats2jspre_JSmath_floor(tmp158);
  tmp160 = ats2jspre_mul_int_double(255, arg9);
  tmp159 = ats2jspre_JSmath_floor(tmp160);
  tmp161 = ats2jspre_String(tmp155);
  tmp162 = ats2jspre_String(tmp157);
  tmp163 = ats2jspre_String(tmp159);
  tmp170 = ats2jspre_string_append("rgb(", tmp161);
  tmp169 = ats2jspre_string_append(tmp170, ",");
  tmp168 = ats2jspre_string_append(tmp169, tmp162);
  tmp167 = ats2jspre_string_append(tmp168, ",");
  tmp166 = ats2jspre_string_append(tmp167, tmp163);
  tmp165 = ats2jspre_string_append(tmp166, ")");
  ats2js_HTML5_canvas2d_set_fillStyle_string(arg0, tmp165);
  draw_Sierpinski__40__1(arg0, tmp149, tmp151, tmp153, arg10);
  return/*_void*/;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__2(arg0, arg1)
{
//
// knd = 0
  var tmpret0__2
  var tmplab, tmplab_js
//
  // __patsflab_point_make
  tmpret0__2 = [arg0, arg1];
  return tmpret0__2;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__3(arg0, arg1)
{
//
// knd = 0
  var tmpret0__3
  var tmplab, tmplab_js
//
  // __patsflab_point_make
  tmpret0__3 = [arg0, arg1];
  return tmpret0__3;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__4(arg0, arg1)
{
//
// knd = 0
  var tmpret0__4
  var tmplab, tmplab_js
//
  // __patsflab_point_make
  tmpret0__4 = [arg0, arg1];
  return tmpret0__4;
} // end-of-function


function
draw_Sierpinski__40__1(env0, arg0, arg1, arg2, arg3)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var tmp124__1
  var tmp125__1
  var tmp126__1
  var tmp127__1
  var tmp130__1
  var tmp132__1
  var tmp133__1
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_draw_Sierpinski
    tmp124__1 = ats2jspre_gte_int0_int0(arg3, 1);
    if(tmp124__1) {
      tmp125__1 = mid_ppp_23(arg0, arg1);
      tmp126__1 = mid_ppp_23(arg1, arg2);
      tmp127__1 = mid_ppp_23(arg2, arg0);
      _057_tmp_057_assigns_057_04_057_Sierpinski_057_DATS_057_Sierpinski_3angle_056_dats__draw3p__42__1(env0, tmp125__1, tmp126__1, tmp127__1);
      tmp130__1 = ats2jspre_sub_int0_int0(arg3, 1);
      draw_Sierpinski__40__1(env0, arg0, tmp125__1, tmp127__1, tmp130__1);
      tmp132__1 = ats2jspre_sub_int0_int0(arg3, 1);
      draw_Sierpinski__40__1(env0, tmp125__1, arg1, tmp126__1, tmp132__1);
      tmp133__1 = ats2jspre_sub_int0_int0(arg3, 1);
      // ATStailcalseq_beg
      apy0 = tmp127__1;
      apy1 = tmp126__1;
      apy2 = arg2;
      apy3 = tmp133__1;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      funlab_js = 1; // __patsflab_draw_Sierpinski
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
_057_tmp_057_assigns_057_04_057_Sierpinski_057_DATS_057_Sierpinski_3angle_056_dats__draw3p__42__1(env0, arg0, arg1, arg2)
{
//
// knd = 0
  var tmp139__1
  var tmp140__1
  var tmp142__1
  var tmp143__1
  var tmp145__1
  var tmp146__1
  var tmplab, tmplab_js
//
  // __patsflab_draw3p
  ats2js_HTML5_canvas2d_save(env0);
  ats2js_HTML5_canvas2d_beginPath(env0);
  tmp139__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__4(arg0);
  tmp140__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__4(arg0);
  ats2js_HTML5_canvas2d_moveTo(env0, tmp139__1, tmp140__1);
  tmp142__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__5(arg1);
  tmp143__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__5(arg1);
  ats2js_HTML5_canvas2d_lineTo(env0, tmp142__1, tmp143__1);
  tmp145__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__6(arg2);
  tmp146__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__6(arg2);
  ats2js_HTML5_canvas2d_lineTo(env0, tmp145__1, tmp146__1);
  ats2js_HTML5_canvas2d_closePath(env0);
  ats2js_HTML5_canvas2d_fill(env0);
  ats2js_HTML5_canvas2d_restore(env0);
  return/*_void*/;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__4(arg0)
{
//
// knd = 0
  var tmpret1__4
  var tmplab, tmplab_js
//
  // __patsflab_point_get_x
  tmpret1__4 = arg0[0];
  return tmpret1__4;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__4(arg0)
{
//
// knd = 0
  var tmpret2__4
  var tmplab, tmplab_js
//
  // __patsflab_point_get_y
  tmpret2__4 = arg0[1];
  return tmpret2__4;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__5(arg0)
{
//
// knd = 0
  var tmpret1__5
  var tmplab, tmplab_js
//
  // __patsflab_point_get_x
  tmpret1__5 = arg0[0];
  return tmpret1__5;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__5(arg0)
{
//
// knd = 0
  var tmpret2__5
  var tmplab, tmplab_js
//
  // __patsflab_point_get_y
  tmpret2__5 = arg0[1];
  return tmpret2__5;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__6(arg0)
{
//
// knd = 0
  var tmpret1__6
  var tmplab, tmplab_js
//
  // __patsflab_point_get_x
  tmpret1__6 = arg0[0];
  return tmpret1__6;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__6(arg0)
{
//
// knd = 0
  var tmpret2__6
  var tmplab, tmplab_js
//
  // __patsflab_point_get_y
  tmpret2__6 = arg0[1];
  return tmpret2__6;
} // end-of-function


/* ATSextcode_beg() */
//
var
canvas =
document.getElementById
(
"Patsoptaas-Evaluate-canvas"
);
var ctx2d = canvas.getContext( '2d' );
//
var N = 6;
//
function
draw_Sierpinski_canvas_show(theDepth)
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
ctx2d.moveTo(0, wh2);
ctx2d.lineTo(wh2, wh2);
ctx2d.lineTo(wh2/2, 0);
ctx2d.closePath();
ctx2d.fillStyle = "#0000ff";
ctx2d.fill(/*void*/);
//
draw_Sierpinski_canvas
(
  ctx2d, 0, wh2, wh2, wh2, wh2/2, 0, 1.0, 1.0, 0.0, depth
); // draw_Sierpinski_canvas
//
ctx2d.restore();
//
return;
//
} // end of [draw_Sierpinski_canvas_show]
//
/* ATSextcode_end() */

/* ****** ****** */

/* end-of-compilation-unit */