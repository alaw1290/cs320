(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -DATS_MEMALLOC_LIBC \
// -o choose_int_sol choose_int_sol.dats
//
// How to test it:
// ./choose_int_sol
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#include "./../assign05.dats"

(* ****** ****** *)

#include
"$PATSHOMELOCS\
/effectivats-divideconquer/mylibies.hats"

(* ****** ****** *)

#staload DC = $DivideConquer

(* ****** ****** *)
//
assume
$DC.input_t0ype = (int, int)
//
assume $DC.output_t0ype = int
//
(* ****** ****** *)
//
// Please give your implementation as follows:
//

//implement
//{}(*tmp*)
//DC_solve(x0) = 
//let
//	val test = DC_base_test<>(x0)
//in 
//	if (test)
//		then DC_base_solve<>(x0)
//		else r0 where {
//				  val xs = DC_divide<>(x0)
//				  val r0 = DC_conquer<>(x0, xs)
//				} 
//end

//
//implement
//{}(*tmp*)
//DC_conquer (x0, xs) = r0 where {
//							val rs = list0_map<input><output>(xs, lam(x) => DC_solve<>(x)) 
//							val r0 = DC_conquer_combine<>(x0, rs)
//						} (* end of [DC_conquer] *)
//

#define :: list0_cons
#define nil list0_nil

local

implement
$DC.DC_base_test<>(param) = (param.1 < 1 || param.0 <= param.1)

implement
$DC.DC_base_solve<>(param) = (
		if (param.1 < 1 || param.0 = param.1)
			then 1 
			else 0
		)

implement
$DC.DC_divide<>(param) = 
		let 
			val n_1 = param.0 - 1
			val i = param.1 
			val i_1 = param.1 - 1
		in//C(n - 1, i) C(n - 1, i - 1)
			(n_1, i) :: (n_1, i_1) :: nil()
		end

implement
$DC.DC_conquer_combine<>(_,rs) = list0_foldleft<int><int>(rs, 0, lam (x,y) => x + y)

in

implement
choose_int(n,i) = $DC.DC_solve<>(@(n,i))

end

(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else

implement
main0() = () where
{

val () = println! ( "Hello from [choose_int_sol]!" ) (* println! *)

val () = println! ("choose(5, 2) = ", choose_int(5, 2)) //10

val () = println! ("choose(10, 4) = ", choose_int(10, 4)) //210
val () = println! ("choose(10, 5) = ", choose_int(10, 5)) //252
val () = println! ("choose(10, 6) = ", choose_int(10, 6)) //210

} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [choose_int_sol.dats] *)
