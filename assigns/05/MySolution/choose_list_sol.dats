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
$DC.input_t0ype = (list0(elt), int, int)
//
assume
$DC.output_t0ype = list0(list0(elt))
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
choose_list(xs,i) = $DC.DC_solve<>(@(xs,length(xs),i))

end

(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else

assume
choose_list_elt = int

implement
main0() = () where
{
//
val () = println! ( "Hello from [choose_list_sol]!" ) (* println! *)

val xs = $list{int} (1, 2, 3, 4, 5, 6, 7, 8, 9, 10) (* val *)
val xs = g0ofg1(xs)

val xss = choose_list(xs, 5)

val out = stdout_ref

val ((*void*)) = fprint_listlist0_sep(out, xss, "\n", ", ")

val ((*void*)) = fprint_newline(out)
//
} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [choose_list_sol.dats] *)
