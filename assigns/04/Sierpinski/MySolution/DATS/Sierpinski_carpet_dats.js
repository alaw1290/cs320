/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2017-2-23:  4h:42m
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
  tmp100 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__div_vector_scalar__15__1(tmp110, 3.0);
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
draw_Sierpinski_canvas(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
{
//
// knd = 0
  var tmp171
  var tmp173
  var tmp175
  var tmp177
  var tmp179
  var tmp180
  var tmp181
  var tmp182
  var tmp183
  var tmp184
  var tmp185
  var tmp186
  var tmp187
  var tmp189
  var tmp190
  var tmp191
  var tmp192
  var tmp193
  var tmp194
  var tmplab, tmplab_js
//
  // __patsflab_draw_Sierpinski_canvas
  tmp171 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__2(arg1, arg2);
  tmp173 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__3(arg3, arg4);
  tmp175 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__4(arg5, arg6);
  tmp177 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__5(arg7, arg8);
  tmp180 = ats2jspre_mul_int_double(255, arg9);
  tmp179 = ats2jspre_JSmath_floor(tmp180);
  tmp182 = ats2jspre_mul_int_double(255, arg10);
  tmp181 = ats2jspre_JSmath_floor(tmp182);
  tmp184 = ats2jspre_mul_int_double(255, arg11);
  tmp183 = ats2jspre_JSmath_floor(tmp184);
  tmp185 = ats2jspre_String(tmp179);
  tmp186 = ats2jspre_String(tmp181);
  tmp187 = ats2jspre_String(tmp183);
  tmp194 = ats2jspre_string_append("rgb(", tmp185);
  tmp193 = ats2jspre_string_append(tmp194, ",");
  tmp192 = ats2jspre_string_append(tmp193, tmp186);
  tmp191 = ats2jspre_string_append(tmp192, ",");
  tmp190 = ats2jspre_string_append(tmp191, tmp187);
  tmp189 = ats2jspre_string_append(tmp190, ")");
  ats2js_HTML5_canvas2d_set_fillStyle_string(arg0, tmp189);
  draw_Sierpinski__40__1(arg0, tmp171, tmp173, tmp175, tmp177, arg12);
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
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_make__0__5(arg0, arg1)
{
//
// knd = 0
  var tmpret0__5
  var tmplab, tmplab_js
//
  // __patsflab_point_make
  tmpret0__5 = [arg0, arg1];
  return tmpret0__5;
} // end-of-function


function
draw_Sierpinski__40__1(env0, arg0, arg1, arg2, arg3, arg4)
{
//
// knd = 1
  var apy0
  var apy1
  var apy2
  var apy3
  var apy4
  var tmp124__1
  var tmp125__1
  var tmp126__1
  var tmp127__1
  var tmp128__1
  var tmp129__1
  var tmp130__1
  var tmp131__1
  var tmp132__1
  var tmp133__1
  var tmp134__1
  var tmp135__1
  var tmp136__1
  var tmp139__1
  var tmp141__1
  var tmp143__1
  var tmp145__1
  var tmp147__1
  var tmp149__1
  var tmp151__1
  var tmp152__1
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab_draw_Sierpinski
    tmp124__1 = ats2jspre_gte_int0_int0(arg4, 1);
    if(tmp124__1) {
      tmp125__1 = mid_ppp_23(arg0, arg1);
      tmp126__1 = mid_ppp_23(arg1, arg0);
      tmp127__1 = mid_ppp_23(arg1, arg2);
      tmp128__1 = mid_ppp_23(arg2, arg1);
      tmp129__1 = mid_ppp_23(arg2, arg3);
      tmp130__1 = mid_ppp_23(arg3, arg2);
      tmp131__1 = mid_ppp_23(arg3, arg0);
      tmp132__1 = mid_ppp_23(arg0, arg3);
      tmp133__1 = mid_ppp_23(tmp125__1, tmp130__1);
      tmp134__1 = mid_ppp_23(tmp126__1, tmp129__1);
      tmp135__1 = mid_ppp_23(tmp129__1, tmp126__1);
      tmp136__1 = mid_ppp_23(tmp130__1, tmp125__1);
      _057_home_057_ubuntu_057_workspace_057_cs320_055_2017_055_spring_055_alaw_057_assigns_057_04_057_Sierpinski_057_MySolution_057_DATS_057_Sierpinski_carpet_056_dats__draw4p__42__1(env0, tmp133__1, tmp134__1, tmp135__1, tmp136__1);
      tmp139__1 = ats2jspre_sub_int0_int0(arg4, 1);
      draw_Sierpinski__40__1(env0, arg0, tmp125__1, tmp133__1, tmp132__1, tmp139__1);
      tmp141__1 = ats2jspre_sub_int0_int0(arg4, 1);
      draw_Sierpinski__40__1(env0, tmp125__1, tmp126__1, tmp134__1, tmp133__1, tmp141__1);
      tmp143__1 = ats2jspre_sub_int0_int0(arg4, 1);
      draw_Sierpinski__40__1(env0, tmp126__1, arg1, tmp127__1, tmp134__1, tmp143__1);
      tmp145__1 = ats2jspre_sub_int0_int0(arg4, 1);
      draw_Sierpinski__40__1(env0, tmp134__1, tmp127__1, tmp128__1, tmp135__1, tmp145__1);
      tmp147__1 = ats2jspre_sub_int0_int0(arg4, 1);
      draw_Sierpinski__40__1(env0, tmp135__1, tmp128__1, arg2, tmp129__1, tmp147__1);
      tmp149__1 = ats2jspre_sub_int0_int0(arg4, 1);
      draw_Sierpinski__40__1(env0, tmp136__1, tmp135__1, tmp129__1, tmp130__1, tmp149__1);
      tmp151__1 = ats2jspre_sub_int0_int0(arg4, 1);
      draw_Sierpinski__40__1(env0, tmp131__1, tmp136__1, tmp130__1, arg3, tmp151__1);
      tmp152__1 = ats2jspre_sub_int0_int0(arg4, 1);
      // ATStailcalseq_beg
      apy0 = tmp132__1;
      apy1 = tmp133__1;
      apy2 = tmp136__1;
      apy3 = tmp131__1;
      apy4 = tmp152__1;
      arg0 = apy0;
      arg1 = apy1;
      arg2 = apy2;
      arg3 = apy3;
      arg4 = apy4;
      funlab_js = 1; // __patsflab_draw_Sierpinski
      // ATStailcalseq_end
    } else {
      // ATSINSmove_void
    } // endif
    if (funlab_js > 0) continue; else return/*_void*/;
  } // endwhile-fun
} // end-of-function


function
_057_home_057_ubuntu_057_workspace_057_cs320_055_2017_055_spring_055_alaw_057_assigns_057_04_057_Sierpinski_057_MySolution_057_DATS_057_Sierpinski_carpet_056_dats__draw4p__42__1(env0, arg0, arg1, arg2, arg3)
{
//
// knd = 0
  var tmp158__1
  var tmp159__1
  var tmp161__1
  var tmp162__1
  var tmp164__1
  var tmp165__1
  var tmp167__1
  var tmp168__1
  var tmplab, tmplab_js
//
  // __patsflab_draw4p
  ats2js_HTML5_canvas2d_save(env0);
  ats2js_HTML5_canvas2d_beginPath(env0);
  tmp158__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__4(arg0);
  tmp159__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__4(arg0);
  ats2js_HTML5_canvas2d_moveTo(env0, tmp158__1, tmp159__1);
  tmp161__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__5(arg1);
  tmp162__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__5(arg1);
  ats2js_HTML5_canvas2d_lineTo(env0, tmp161__1, tmp162__1);
  tmp164__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__6(arg2);
  tmp165__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__6(arg2);
  ats2js_HTML5_canvas2d_lineTo(env0, tmp164__1, tmp165__1);
  tmp167__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__7(arg3);
  tmp168__1 = ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__7(arg3);
  ats2js_HTML5_canvas2d_lineTo(env0, tmp167__1, tmp168__1);
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


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_x__1__7(arg0)
{
//
// knd = 0
  var tmpret1__7
  var tmplab, tmplab_js
//
  // __patsflab_point_get_x
  tmpret1__7 = arg0[0];
  return tmpret1__7;
} // end-of-function


function
ATSCNTRB_056_libats_055_hwxi_056_teaching_056_mydraw__point_get_y__2__7(arg0)
{
//
// knd = 0
  var tmpret2__7
  var tmplab, tmplab_js
//
  // __patsflab_point_get_y
  tmpret2__7 = arg0[1];
  return tmpret2__7;
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
/* ATSextcode_end() */

/* ****** ****** */

/* end-of-compilation-unit */