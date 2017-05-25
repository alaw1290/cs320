(* ****** ****** *)
(*
** Board implementation
*)
(* ****** ****** *)
//
#include "./theParams.hats"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
#staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)

#define N 48
#define W 600
#define H 420
#define W2 300.0
#define H2 210.0
#define WH 400

(* ****** ****** *)
//
#staload "./main.sats"
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
extern
fun
theBoard_draw
(ctx: canvas2d): void
//
implement
theBoard_draw(ctx) = 
  
  let
    
    val BN = 1.0*WH/N // 8.3333
    val x0 = 1.0*(W-WH)/2 // 100
    val y0 = 1.0*(H-WH)/2 // 10
    val c0 = "#000000" // worm
    and c1 = "#7f7f7f" // obstacle
    and c2 = "#ff0000" // apple
    val c3 = "#cecece" // path
    val theBoard = theBoard_get()
    
    fun auxone(nx: int, ny: int) : void = 
      let
        val k0 = theBoard[nx, ny]
      in
        ifcase
          | k0 = Blank => ()
          | k0 = Worm => () 
              where {
                val () = ctx.fillStyle(c0)
                val () = ctx.beginPath()
                val () = ctx.rect(x0+nx*BN, y0+ny*BN, BN, BN)
                val () = ctx.closePath()
                val () = ctx.fill((*void*))
              } (* end of [k0 = Worm] *)
          | k0 = Obstacle => () 
              where {
                val () = ctx.fillStyle(c1)
                val () = ctx.beginPath()
                val () = ctx.rect(x0+nx*BN, y0+ny*BN, BN, BN)
                val () = ctx.closePath()
                val () = ctx.fill((*void*))
              } (* end of [k0 = Obstacle] *)
          | k0 = Apple => () 
              where {
                val () = ctx.fillStyle(c2)
                val () = ctx.beginPath()
                val () = ctx.rect(x0+nx*BN, y0+ny*BN, BN, BN)
                val () = ctx.closePath()
                val () = ctx.fill((*void*))
              } (* end of [k0 = Apple] *)
          | k0 = Path => () 
              where {
                val () = ctx.fillStyle(c3)
                val () = ctx.beginPath()
                val () = ctx.rect(x0+nx*BN, y0+ny*BN, BN, BN)
                val () = ctx.closePath()
                val () = ctx.fill((*void*))
              } (* end of [k0 = Apple] *)
      end // end of [auxone]
    
    fun auxrow (nx: int, ny: int) : void =
      if (nx < N)
        then () 
          where {
            val () = auxone(nx, ny)
            val () = auxrow(nx+1, ny)
          } (* end of [then] *)
    
    fun auxrows (ny: int) : void =
      if (ny < N)
        then (auxrow(0, ny); auxrows(ny+1)) (* end of [then] *)
    
    val () = ctx.fillStyle(c3)
    val () = ctx.beginPath()
    val () = ctx.rect(97.0, 7.0, 406.0, 406.0) // x position, y position, x len, y len
    val () = ctx.closePath()
    val () = ctx.fill((*void*))

    val () = ctx.clearRect(99, 9, 402, 402)

  
  in
    
    auxrows(0(*ny*))
  
  end // end of [theBoard_draw]

(* ****** ****** *)

implement
theAllAct_Next_do((*void*)) = 
  let
    val () = theWorm_move_if(R())
    val () = theBoard_takeout_worm()
    val () = theBoard_insert_worm()
  in
    theBoard_draw(theCanvas_ctx2d_get())
  end // end of [theAllAct_Next_do]

implement
theAllAct_Prev_do((*void*)) = 
  let
    val () = theWorm_move_if(L())
    val () = theBoard_takeout_worm()
    val () = theBoard_insert_worm()
  in
    theBoard_draw(theCanvas_ctx2d_get())
  end // end of [theAllAct_Prev_do]

(* ****** ****** *)

implement
theAllAct_Next2_do((*void*)) = 
  let
    val () = theWorm_move_if(D())
    val () = theBoard_takeout_worm()
    val () = theBoard_insert_worm()
  in
    theBoard_draw(theCanvas_ctx2d_get())
  end // end of [theAllAct_Next2_do]

(* ****** ****** *)

implement
theAllAct_Prev2_do((*void*)) = 
  let
    val () = theWorm_move_if(U())
    val () = theBoard_takeout_worm()
    val () = theBoard_insert_worm()
  in
    theBoard_draw(theCanvas_ctx2d_get())
  end // end of [theAllAct_Prev2_do]

(* ****** ****** *)

implement
theAllAct_Random_do((*void*)) = 
  let
    val lr = (if JSmath_random() <= 0.5 then 0 else 1): int
    val ud = (if JSmath_random() <= 0.5 then 0 else 1): int
  in
    case+ (lr, ud) of
      | (0, 0) => theAllAct_Prev_do() //left
      | (_, 0) => theAllAct_Next_do() //right
      | (0, _) => theAllAct_Prev2_do() //up
      | (_, _) => theAllAct_Next2_do() //down
  end // end of [theAllAct_Random_do]

(* ****** ****** *)

implement
theAllAct_Search_do() = 
  let
    val search_res = theSearch_search()
  in
//    case+ search_res of
//      | None() => theAllAct_Random_do()
//      | Some(res) => (
//          let 

//            val- list0_cons(p,_) = res
//            val worm = theWorm_get()
//            val worm_pos = worm.pos()

//            val diff_x_left = worm_pos.0 - p.0
//            val diff_x_right = p.0 - worm_pos.0
//            val diff_y_down = worm_pos.1 - p.1
//            val diff_y_up = p.1 - worm_pos.1

//          in

//            if ~(diff_x_left = 0 && diff_x_right = 0) 

//              then (//horizontal
//                if diff_x_left <= diff_x_right
//                  then theAllAct_Prev_do() //left closer
//                  else theAllAct_Next_do() //right closer
//                  )

//              else (//vertical
//                if diff_y_down <= diff_y_up
//                  then theAllAct_Next2_do() //down closer
//                  else theAllAct_Prev2_do() //up closer
//                  )

//          end
//        )

//      case+ search_res of
//      | None() => theAllAct_Random_do()
//      | Some(res) => (
//          let 

//            val- list0_cons(p,_) = res
//            val worm = theWorm_get()
//            val wp = worm.pos()

//          in

//            if ~(wp.0 = p.0) 

//              then (//horizontal
//                if wp.0 - p.0 > 0
//                  then theAllAct_Prev_do() //move left
//                  else theAllAct_Next_do() //move right
//                  )

//              else (//vertical
//                if wp.1 - p.1 < 0
//                  then theAllAct_Next2_do() //move down 
//                  else theAllAct_Prev2_do() //move up 
//                  )

//          end
//        )

      case+ search_res of
      | None() => (alert("No more valid apples!");theAllAct_Random_do())
      | Some(res) => (
          let 

            fun get_2nd_last(lst: list0($tup(int,int))) : $tup(int,int) =
              case- lst of
                | list0_cons(x,list0_cons(y,list0_nil())) => x
                | list0_cons(x,xs) => get_2nd_last(xs)

            fun draw_path(lst: list0($tup(int,int))) : void =
              let
                val matrix = theBoard_get()
                val () = matrix.foreach()(lam (x,y) => (if matrix[x,y] = Path then matrix[x,y] := Blank else () ))
              in
                lst.foreach()(lam (p) => (if matrix[p.0,p.1] = Blank then matrix[p.0,p.1] := Path else () ))
              end

            fun x_dec(x: int): int = if x > 0 then (x-1) else (XLEN-1)
            fun x_inc(x: int): int = if x+1 < XLEN then (x+1) else 0
            fun y_dec(y: int): int = if y > 0 then (y-1) else (YLEN-1)
            fun y_inc(y: int): int = if y+1 < YLEN then (y+1) else 0

            fun pos_x_dec(xy: pos): pos = $tup(x_dec(xy.0), xy.1) //move left
            fun pos_x_inc(xy: pos): pos = $tup(x_inc(xy.0), xy.1) //move right
            fun pos_y_dec(xy: pos): pos = $tup(xy.0, y_dec(xy.1)) //move up
            fun pos_y_inc(xy: pos): pos = $tup(xy.0, y_inc(xy.1)) //move down
            //

            val () = draw_path(res)
            val p = get_2nd_last(res)
            val $tup(px,py) = p
            val worm = theWorm_get()
            val wp = worm.pos()

//            val $tup(px,py) = p
//            val $tup(wx,wy) = wp

//            val () = $extfcall(void,"console.log",wp) 
//            val () = $extfcall(void,"console.log",p) 

          in

            ifcase

              | ((pos_x_dec(wp)).0 = p.0 && (pos_x_dec(wp)).1 = p.1) => theAllAct_Prev_do() //left
              | ((pos_x_inc(wp)).0 = p.0 && (pos_x_inc(wp)).1 = p.1) => theAllAct_Next_do() //right
              | ((pos_y_dec(wp)).0 = p.0 && (pos_y_dec(wp)).1 = p.1) => theAllAct_Prev2_do() //up
              | ((pos_y_inc(wp)).0 = p.0 && (pos_y_inc(wp)).1 = p.1) => theAllAct_Next2_do() //down

          end
        )
  end
        
  

(* ****** ****** *)

implement
theAllAct_Reset_do((*void*)) = 
  let
    //
    val () = theBoard_takeout_worm()
    //
    val () = cleanBoard()
    //
    val () = theWorm_reset()
    //
    val () = theBoard_insert_worm()
    //
    val r = $extfcall(double,"Math.random") * 100
    val () = if r > 66.6 then randomBoard() else if r > 33.3 then scene1() else scene2()
    val () = placeApples(50)
    
    //
  in
    theBoard_draw(theCanvas_ctx2d_get())
  end // end of [theAllAct_Reset_do]

(* ****** ****** *)

(* end of [theControl.dats] *)
