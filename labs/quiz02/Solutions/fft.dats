
(* Headers *)
#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"
#include "$PATSHOMELOCS/effectivats-divideconquer/mylibies.hats"
#staload DC = $DivideConquer

(* Complex number library. Please look at its source code for functions you can use.
   You can always google complex numbers to refresh your knowledge about it.
*)
#include "complex.dats"

(* Pre-defined *)
#define ::  list0_cons 
#define nil list0_nil 

(* Pleaser refer to imap, map2, and other similar functions on the following page. This is 
   a very similar function. 
  
   http://ats-lang.sourceforge.net/LIBRARY/libats/ML/SATS/DOCUGEN/HTML/list0.html#list0_foreach2
*)
extern fun {a:t@ype} {b:t@ype} list0_imap2 (list0 a, list0 a, (int, a, a) -<cloref1> b): list0 b 

implement {a}{b} list0_imap2 (xs, ys, f) = let 
	fun loop (i: int, xs: list0 a, ys: list0 a): list0 b = 
		case+ (xs, ys) of
		| (x::xs, y::ys) => f (i, x, y) :: loop (i+1, xs, ys)
		| (_, _) => nil ()
in 
	loop (0, xs, ys)
end

(* Main FastFourierTransform function. 

   A polynomial (e.g. A(x) = a0 + a1 x + a2 x^2 + ... + ad x^d, of degree d) can be represented in two ways. 

   1. using a list of coefficients: a0 :: a1 :: a2 :: ... :: ad :: nil()
   2. using a list of values (read: evaluate function A(x) on d+1 different inputs): A(x0) :: A(x1) :: A(x2) :: .. :: A(xd) :: nil()

   FFT can be used to transfrom one representation into another, efficiently. It is also a classic example of Divide and Conquer strategy.

   Input1: coeeficient representation of a polynomial A(x) 

   Input2: w, one of N-th roots of unity, it is used to generate points for evaluating A(x) efficiently
           see https://people.eecs.berkeley.edu/~vazirani/algorithms/chap2.pdf @ Page 74 for more info on N-th roots of unity.

   Output: value representation of the same A(x). 
           specifically, it is 

           A(w^0) :: A(w^1) :: ... :: A(w^(N-1))

   A crucial step is to divide the problem into two smaller subproblems, using the following strategy. 

   If we view the list of coefficients A as two parts: items at even positions A1, and items at odd positions A2,
   then FFT(A, w) can be split into FFT(A1, w^2) and FFT(A2, w^2). And A(w^i) = A1(w^(2*i)) + w^i * A2(w^(2*i))

   A detailed description of this algorithm can be found here
   https://people.eecs.berkeley.edu/~vazirani/algorithms/chap2.pdf @ Page 75

*)
extern fun fft (list0 complex, complex): list0 complex

(* The benchmark function will test run FFT on different random inputs up to SIZE, with each size iterated ITER times.

   Input1: the max size of input, must be a power of 2
   Input2: iterations need to be run for each size
*)
extern fun benchmark (size: int, iter: int): void



local (* LOCAL-IN-END *)

(* Input type is a tuple, the first field is the coefficient representation of A(x), and second part is w, a n-th root of unity *)
assume $DC.input_t0ype = @(list0 complex, complex)

(* Output type is the value representation of A(x) *)
assume $DC.output_t0ype = list0 complex

(* Please implement this function *)
implement $DC.DC_base_test<> (pair) = 
	ceq (pair.1, cmake(1.0, 0.0))

(* Please implement this function *)
implement $DC.DC_base_solve<> (pair) = 
	pair.0

(* Please implement this function *)
implement $DC.DC_divide<> (pair) = let 
	val @(coeff, w) = pair 

	fun divide (xs: list0 complex, a: list0 complex, b: list0 complex, i: int): @(list0 complex, list0 complex) = 
		case+ xs of 
		| nil () => @(list0_reverse a, list0_reverse b)
		| x :: xs => if i mod 2 = 0 then divide (xs, x :: a, b, i+1) else divide (xs, a, x :: b, i+1)

	val @(even, odd) = divide (coeff, nil(), nil(), 0)
in 
	@(even, cmult(w, w)) :: @(odd, cmult(w, w)) :: nil()
end

(* Please implement this function *)
implement $DC.DC_conquer_combine<> (input, outputs) = let 
	val  @(coeff, w) = input
	val- even :: odd :: nil() = outputs

	fun power (w:complex, j:int): complex = cfrompolar(1.0, j * carg(w))

	val fsthalf = list0_imap2<complex><complex> (even, odd, lam (j, s1, s2) => cadd(s1, cmult (power (w, j), s2)))
	val sndhalf = list0_imap2<complex><complex> (even, odd, lam (j, s1, s2) => cminus(s1, cmult (power (w, j), s2)))
in 
	list0_append(fsthalf, sndhalf)
end

in (* LOCAL-IN-END *)

(* The implementation for FFT is just invoking Divide and Conquer *)
implement fft (coeff, w) = $DC.DC_solve<> (@(coeff, w))

(* The implementation for the benchmarking function *)
implement benchmark (size, iter) = let 

	(* Random list of coefficients of the form (random + 0.0i) *)
	fun random_coeff (size: int): list0 complex = 
		if size = 0 then nil ()
		else cmake(1.0 * $extfcall(int, "random"), 0.0) :: random_coeff (size - 1)

	(* Test one size *)
	fun one (iter: int): void = 
		if iter = 0 then ()
		else let 
			val a = random_coeff size
			val w = cfrompolar (1.0, 2 * M_PI / size)

			val b = fft (a, w)

			val a' = fft (b, cfrompolar(1.0, ~1*carg(w)))
			val a' = list0_map<complex><complex> (a', lam c => cmake(creal(c)/size, cimag(c)/size))

			val cmp = list0_forall2<complex,complex>(a, a', lam (c1, c2) => ceq (c1, c2))
			val _ = assertloc (cmp)
		in 
			one (iter - 1)
		end
in 
	if size = 0 then ()
	else (print_int (size); one (iter); println! ("\tpassed!"); benchmark (size/2, iter))
end

implement main0 () = benchmark (4096, 50)

end (* LOCAL-IN-END *)
