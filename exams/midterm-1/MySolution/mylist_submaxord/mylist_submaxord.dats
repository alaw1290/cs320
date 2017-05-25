(* ****** ****** *)

(*
** Midterm-1:
** mylist_submaxord:
//
// HX: 20 points
//
// Given a list xs of integers, the function
// [mylist_submaxord] returns the longest leftmost
// subsequence of xs that is ordered.
//
// If xs = (1, 3, 2, 4), then the result is (1, 3, 4)
//
// If xs = (4, 1, 2, 3, 8, 9, 5, 6, 7), then the result
// is (1, 2, 3, 5, 6, 7)
//
*)

(* ****** ****** *)

staload
"./../../midterm-1.dats"

(* ****** ****** *)

staload "./../../mylib/mylist.dats"

#include
"$PATSHOMELOCS\
/effectivats-divideconquer/mylibies.hats"

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

extern
fun
create_combinations(xs: list0(int), i: int): list0(list0(int))


#staload DC = $DivideConquer

assume
$DC.input_t0ype = (list0(int), int, int)

assume
$DC.output_t0ype = list0(list0(int))


#define :: list0_cons
#define nil list0_nil

local

implement
$DC.DC_base_test<>(param) = (param.2 < 1 || param.1 <= param.2)

implement
$DC.DC_base_solve<>(param) = if param.2 < 1 then nil() :: nil () else param.0 :: nil ()

implement
$DC.DC_divide<>(param) = 
		let
			val lst_1 = list0_drop_exn(param.0, 1)
			val n = param.1
			val i = param.2
		in// r1: x out		  r2: x in
			(lst_1,n-1,i) :: (lst_1,n-1,i-1) :: nil ()
		end

implement
$DC.DC_conquer_combine<>(param,rs) = 
		let
			val x_head = list0_head_exn(param.0)
//			val () = println! ("x_head= ", x_head)
			val- r1 :: r2 :: nil () = rs
			val r2 = list0_mapcons(x_head,r2)
		in
			list0_append(r1, r2)
		end

in

implement
create_combinations(xs,i) = $DC.DC_solve<>(@(xs,length(xs),i))

end

fun aux_check_seq(xs:list0(int), res:list0(int) ) : list0(int) = 
	case+ xs of
		| nil () => res
		| x :: nil () => res
		| x :: y :: nil () => if x < y then res else list0_nil ()
		| x :: y :: ys => if x < y then aux_check_seq(y :: ys,res) else list0_nil ()

fun aux_tests_seq(tests: list0(list0(int)), l:int ) : list0(int) =
	case+ tests of
		| list0_nil() => list0_nil ()
		| list0_cons(test,ts) =>(
								let 
									val seq = aux_check_seq(test, test)
								in
									if length(seq) >= l then seq else aux_tests_seq(ts, l)
								end
								)


fun aux_submaxord (xs:list0(int), l:int) : list0(int) =
	if l > 1 
		then(
			let
				val tests = create_combinations(xs, l)
				val t = aux_tests_seq(tests,l)
			in 
				if length(t) < l
					then aux_submaxord(xs, l - 1)
					else t
			end
			)

		else
			list0_cons( list0_head_exn(xs), list0_nil() )



implement
mylist_submaxord(xs) = aux_submaxord(xs, length(xs))

(* ****** ****** *)

implement
main0 () =
{

val () = println!("Testing for mylist_submaxord")

val xs = g0ofg1 ($list{int}(1,5,2,20,5,6))
val ys = mylist_submaxord(xs)
val () = println! ("ys = ", ys)

val xs = g0ofg1 ($list{int}(4, 1, 2, 3, 8, 9, 5, 6, 7))
val ys = mylist_submaxord(xs)
val () = println! ("ys = ", ys)

val xs = g0ofg1 ($list{int}(15, 27, 14, 38, 26, 55, 46, 65, 85))
val ys = mylist_submaxord(xs)
val () = println! ("ys = ", ys)

val xs = g0ofg1 ($list{int}(0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15))
val ys = mylist_submaxord(xs)
val () = println! ("ys = ", ys)

//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist_submaxord.dats] *)
