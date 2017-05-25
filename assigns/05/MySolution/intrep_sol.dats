(* ****** ****** *)
//
// HX:
// How to compile:
// patscc -DATS_MEMALLOC_LIBC \
// -o intrep_sol intrep_sol.dats
//
// How to test it:
// ./intrep_sol
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#include "./../assign05.dats"

(* ****** ****** *)
//
fun
intrep2int (xs: list0(int)) : int =
	list0_foldright<int><int>(xs, lam(x, n) => 2*n + x, 0) (* list0_foldright *)
//
(* ****** ****** *)
//
// Please give your implementation as follows:
//

fun
int2intrep (x:int): list0(int) = aux(x,list0_nil()) where {
	fun aux(remainder:int, res:list0(int)): list0(int) = 
		if remainder < 2 
			then list0_reverse(list0_cons(remainder,res))
			else aux(remainder/2, list0_cons(remainder%2,res))
}

//intrep_add

fun aux_add(xs:list0(int), ys:list0(int), res:list0(int), carry:int) : list0(int) = 
	case+ ys of 
	| list0_nil () => (if carry = 0 then list0_reverse(res) else list0_reverse(list0_cons(carry,res)))
	| list0_cons(y,ys) => (
			let
				val x = list0_head_exn(xs)
				val xs = list0_drop_exn(xs,1)
				val bit = x + y + carry
			in
				if bit < 2 then aux_add(xs, ys, list0_cons(bit, res), 0) else aux_add(xs, ys, list0_cons(bit%2, res), 1)
			end
		)

implement 
intrep_add(xs, ys) = 
if length(xs) = length(ys) 
	then aux_add(xs,ys,list0_nil(), 0) 
	else (
		if length(xs) > length(ys) 
			then intrep_add(xs,list0_append(ys,list0_cons{int}(0, list0_nil{int}()))) 
			else intrep_add(list0_append(xs,list0_cons{int}(0, list0_nil{int}())),ys)
		)

//end of intrep_add
//intrep_mul

fun aux_mul(xs:list0(int), ys:list0(int), res:list0(int)): list0(int) = 
	case+ ys of
	| list0_nil () => res
	| list0_cons(y,ys) => (
				let
					val xs_lefted = list0_cons{int}(0,xs)
				in
					if y = 0 
						then aux_mul(xs_lefted, ys, res)
						else aux_mul(xs_lefted, ys, intrep_add(res,xs))
				end
			)


implement
intrep_mul(xs,ys) = 
if length(xs) > length(ys) 
	then aux_mul(xs,ys,list0_nil())
	else aux_mul(ys,xs,list0_nil())

//end of intrep_mul
//intrep_power

fun aux_power(x_bin:list0(int),n_bin:list0(int),res:list0(int)) : list0(int) = 
	case n_bin of
	| list0_nil () => res
	| list0_cons(n,n_bin) => (
				if n = 1
					then aux_power(x_bin,n_bin,intrep_mul(intrep_mul(res,res),x_bin))
					else aux_power(x_bin,n_bin,intrep_mul(res,res))
			)

implement
intrep_power(x,n) = 
	let
		val n_bin = list0_drop_exn(list0_reverse(int2intrep(n)),1)
		val x_bin = int2intrep(x)
	in 
		aux_power(x_bin,n_bin,x_bin)
	end

//end of intrep_power

(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else

implement
main0() = () where
{ 
//
val () = println! ("Hello from [intrep_sol]!") (* println! *)

val foo = int2intrep(231)
val bar = int2intrep(92912)
val baz = int2intrep(8002231)

val () = println!("foo = ", intrep2int(foo))
val () = println!("bar = ", intrep2int(bar))
val () = println!("baz = ", intrep2int(baz))

val add_1 = intrep_add(foo,bar)
val add_2 = intrep_add(add_1,baz)
val add_3 = intrep_add(foo,baz)

//val () = println!("add_1 = ", add_1)
//val () = println!("add_2 = ", add_2)
//val () = println!("add_3 = ", add_3)

val () = println!("foo + bar = ", intrep2int(add_1))
val () = println!("add1 + baz = ", intrep2int(add_2))
val () = println!("foo + baz = ", intrep2int(add_3))

val mul_1 = intrep_mul(foo,bar)
val mul_2 = intrep_mul(mul_1,bar)
val mul_3 = intrep_mul(foo,baz)

//val () = println!("mul_1 = ", mul_1)
//val () = println!("mul_2 = ", mul_2)
//val () = println!("mul_3 = ", mul_3)

val () = println!("foo * bar = ", intrep2int(mul_1))
val () = println!("mul_1 * bar = ", intrep2int(mul_2))
val () = println!("foo * baz = ", intrep2int(mul_3))

val () = println!("power(2, 10) = ", intrep2int(intrep_power(2, 10)))
val () = println!("power(3, 10) = ", intrep2int(intrep_power(3, 10)))
val () = println!("power(3, 200) = ", intrep_power(3, 200)) //int too large to convert prob use long

} (* end of [main0] *)

#endif // end of #ifdef(MAIN_NONE)

(* ****** ****** *)

(* end of [intrep_sol.dats] *)
