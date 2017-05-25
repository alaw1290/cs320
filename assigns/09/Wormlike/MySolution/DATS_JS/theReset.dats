(* ****** ****** *)
(*
** Scene setup
*)
(* ****** ****** *)
//
#include "./theParams.hats"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"

#staload "./main.sats"
//
(* ****** ****** *)

implement cleanBoard() = 
	let 
		val matrix = theBoard_get()
	in
		matrix.foreach()(lam (x,y) => matrix[x,y] := Blank)
	end

implement randomBoard() = 
	let
		val matrix = theBoard_get()
	in
		matrix.foreach()
			(lam (x,y) => 
				let 
					val r = $extfcall(double,"Math.random") * 100
				in 
					if x = 0 && y = 0 then ()
					else if r > 2.0 then matrix[x,y] := Blank
					else matrix[x,y] := Obstacle
				end
			)
	end

implement placeApples(n) = 
	let
		val matrix = theBoard_get()
		val x = $extfcall(int,"Math.random") * XLEN
		val x = $extfcall(int,"Math.floor", x)
		val y = $extfcall(int,"Math.random") * YLEN
		val y = $extfcall(int,"Math.floor", y)
		val pos = matrix[x,y]
	in
		if n = 0 
			then ()
			else if pos = Blank 
				then (matrix[x,y] := Apple; placeApples(n-1)) 
				else placeApples(n)
	end


implement scene1() = 
	let
		val matrix = theBoard_get()
	in
		matrix.foreach()
			(lam (x,y) => 				
				if (x >= 10 && x <= 19) && (y = 6 || y = 14 || y = 22) 
					then matrix[x,y] := Obstacle
					else if (x = 19) && (y >= 6 && y <= 22)
						then matrix[x,y] := Obstacle
						else 
				if (x >= 27 && x <= 36) && (y = 22 || y = 30 || y = 38) 
					then matrix[x,y] := Obstacle
					else if (x = 27) && (y >= 22 && y <= 38)
						then matrix[x,y] := Obstacle
						else if (x = 36) && (y >= 30 && y <= 38)
							then matrix[x,y] := Obstacle
							else ()
			)
	end

implement scene2() = 
	let
		val matrix = theBoard_get()
		val () = matrix[32,12] := Obstacle
		val () = matrix[31,13] := Obstacle
		val () = matrix[33,13] := Obstacle
		val () = matrix[31,14] := Obstacle
		val () = matrix[33,14] := Obstacle
		val () = matrix[30,15] := Obstacle
		val () = matrix[34,15] := Obstacle
		val () = matrix[30,16] := Obstacle
		val () = matrix[34,16] := Obstacle
		val () = matrix[29,17] := Obstacle
		val () = matrix[35,17] := Obstacle
		val () = matrix[29,18] := Obstacle
		val () = matrix[35,18] := Obstacle
		val () = matrix[28,19] := Obstacle
		val () = matrix[36,19] := Obstacle
		val () = matrix[28,20] := Obstacle
		val () = matrix[36,20] := Obstacle
		val () = matrix[27,21] := Obstacle
		val () = matrix[37,21] := Obstacle
		val () = matrix[27,22] := Obstacle
		val () = matrix[37,22] := Obstacle
		val () = matrix[26,23] := Obstacle
		val () = matrix[38,23] := Obstacle
		val () = matrix[26,24] := Obstacle
		val () = matrix[38,24] := Obstacle
		val () = matrix[25,25] := Obstacle
		val () = matrix[39,25] := Obstacle
		val () = matrix[25,26] := Obstacle
		val () = matrix[39,26] := Obstacle
		val () = matrix[24,27] := Obstacle
		val () = matrix[40,27] := Obstacle
		val () = matrix[24,28] := Obstacle
		val () = matrix[40,28] := Obstacle
	in
		matrix.foreach()
			(lam (x,y) => 
				if (x = 10) && (y >= 12 && y <= 28) 
					then matrix[x,y] := Obstacle
					else if (x >= 10 && x <= 19) && (y = 28) 
						then matrix[x,y] := Obstacle
						else
				if (x >= 28 && x <= 36) && (y = 21) 
					then matrix[x,y] := Obstacle
					else ()
			)
	end

(* ****** ****** *)

(* end of [theReset.dats] *)
