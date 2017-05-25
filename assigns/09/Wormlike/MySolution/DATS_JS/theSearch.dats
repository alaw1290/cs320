(* ****** ****** *)

#staload "./main.sats"

(* ****** ****** *)
//
#include "./theParams.hats"
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//

#define
LIBATSCC2JS_targetloc
"$PATSHOME/contrib/libatscc2js/ATS2-0.3.2"
#include
"{$LIBATSCC2JS}/staloadall.hats"
#staload
"{$LIBATSCC2JS}/DATS/BUCS320/GraphSearch/GraphSearch_bfs.dats"

//typedef
//bfs_pos = $tup(int, int, bool)

typedef node = list0(pos)
typedef nodelst = list0(node)

#define nil list0_nil
#define :: list0_cons

assume
node_type = node
assume
nodelst_vtype = nodelst

implement
theSearchStore_insert_lst<>(nxs) =
	list0_foreach(nxs, lam nx => theSearchStore_insert(nx))

implement
node_get_neighbors<>(nx) = 
	let
		// get neighboors of nx.head
		val- $tup(x,y) :: _ = nx
		val x_left = (if x > 0 then x-1 else XLEN-1)
		val x_right = (if x+1 < XLEN then x+1 else 0)
		val y_up = (if y > 0 then y-1 else YLEN-1)
		val y_down = (if y+1 < YLEN then y+1 else 0)
		val left = $tup(x_left, y)
		val right = $tup(x_right, y)
		val up = $tup(x, y_up)
		val down = $tup(x, y_down)

//		// traverse neighboors till back at nx.head
//		fun aux (ns: node) : nodelst =
//			case+ ns of 
//			| nil() => nil()
//			| n :: ns => (
//				let
//					val theBoard = theBoard_get()
//					val test = node_is_marked<>(ns)
//				in 
//					if test 
//						then aux(ns) 
//						else list0_cons(list0_cons(n, nx), aux(ns))
//				end
//				)

		// checks if each positon is a valid move 
		fun check_valid(moves:node) : nodelst =
			let
				val theBoard = theBoard_get()
			in
				case+ moves of
					| nil() => nil()
					| n :: ns => (
							if (theBoard[n.0,n.1] = Obstacle) || (theBoard[n.0,n.1] = Worm || node_is_marked<>(n :: ns))
								then check_valid(ns)
								else (n :: nx) :: check_valid(ns)
						)
			end

		val moves = left :: right :: up :: down :: nil()
		val valid_moves = check_valid(moves)

	in
		valid_moves
//		valid_moves.map(TYPE{node_type})(lam x =<cloref1> x :: nx)
	end

implement
theSearch_search() = res[] where {

	val res = ref{Option(list0(pos))}(None)
	val worm = theWorm_get()

	val markBoard = mtrxszref_make_elt{int}(XLEN, YLEN, 0)

	implement node_mark<>(nx) = (let val- $tup(x,y) :: _ = nx in markBoard[x,y] := 1 end )

	implement node_unmark<>(nx) = (let val- $tup(x,y) :: _ = nx in markBoard[x,y] := 0 end )

	implement node_is_marked<>(nx) = (let val- $tup(x,y) :: _ = nx in (markBoard[x,y] = 1) end )

	implement
	process_node<>(nx) = 
		let
			val theBoard = theBoard_get()
			val- $tup(x,y) :: _ = nx
		in
	  		if theBoard[x,y] = Apple then (res[] := Some(nx); false) else (true)
		end 
	
	val nx = list0_sing(worm.pos())

	val store = qlistref_make_nil()
	val ((*void*)) = qlistref_insert(store, nx)
	
	val ((*void*)) = GraphSearch_bfs(store)
	
	}


