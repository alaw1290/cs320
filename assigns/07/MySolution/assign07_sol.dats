(* ****** ****** *)
//
#include
"./../assign07.dats"
//
(* ****** ****** *)
//
// Please give your implementation here
//
(* ****** ****** *)

implement
stream_ln2() = aux(1.0 , 2, 1) where {
	fun aux(psum: double, n:int, sign:int) : stream(double) =
		$delay(stream_cons(psum - (sign * (1.0/n)), aux(psum - (sign * (1.0/n)), n+1, ~sign)))
}

typedef int2 = (int, int)

implement
intpair_enumerate() = aux(@(0,~1)) where {
	fun aux(xs:int2) : stream(int2) = 
		$delay(
				if xs.0 < xs.1 
					then stream_cons(@(xs.0 + 1, xs.1), aux(@(xs.0 + 1, xs.1)))
					else stream_cons(@(0, xs.1 + 1), aux(@(0, xs.1 + 1)))
			)
}

implement
EulerTrans(xs) = aux(xs) where {
	fun aux(xs:stream(double)) : stream(double) = 
		$delay(
				case+ !xs of 
					| stream_nil() => stream_nil()
					| stream_cons(a,xs) => 
								let
									val- stream_cons(b, bs) = !xs //x(n+1)
									val- stream_cons(c, cs) = !bs //x(n+2)
									val res = c - (c-b)*(c-b) / (a + c - 2.0*b)
								in
									stream_cons(res,aux(xs))
								end
			)
}

#ifdef
MAIN_NONE
#then
#else
implement
main0 () =
{
//
val () = println!("Hello from [assign07_sol]!") (* val *)
//
val ln2_1M = stream_nth_exn (stream_ln2(), 1000000)
val () = println! ("ln2_1M = ", ln2_1M)
//
val xys = intpair_enumerate()
val xys_10 = stream_take_exn(xys, 10)
val xys_10 = list0_of_list_vt(xys_10)
//
val () = println! ("xys_10 = ", xys_10)
//
val ln2 = stream_ln2()
val ln2 = EulerTrans(ln2)
val ln2 = EulerTrans(ln2)
val ln2 = EulerTrans(ln2)
val ln2 = EulerTrans(ln2)
val () = println! ("ln2_4_0 = ", stream_nth_exn(ln2, 0))
//
val () = println! ("Good news: Your code has passed initial testing!")
//
} (* end of [main0] *)
#endif // #ifdef

(* ****** ****** *)

(* end of [assign07_sol.dats] *)
