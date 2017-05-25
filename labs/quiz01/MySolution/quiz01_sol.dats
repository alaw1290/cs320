(*
	please compile using

	$> patscc -DATS_MEMALLOC_LIBC quiz01_sol.dats

	and the output can be tested by 

	$> ./a.out
*)


#define ATS_DYNLOADFLAG 0
#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"
#include "../quiz01.dats"

#define ::  list0_cons 
#define nil list0_nil 


implement int2list (digits) = loop(digits,list0_nil(),10) where {
	fun loop(d:int, lst:list0(int), i:int): list0(int) =
		if d > 0 then (
			if d % i = 0 then loop(d / i , list0_cons((d%i)/(i/10) , lst), i*10) else loop(d - (d%i) , list0_cons((d%i)/(i/10) , lst), i*10) ) else lst
}

implement list2int (num) = loop2(list0_reverse(num),0,10) where {
	fun loop2(n:list0(int),res:int,i:int): int = 
		case+ n of
		| list0_nil () => res
		| list0_cons(x,xs) => loop2(xs ,res + (x*i) , i*10)
}


%{
#include <time.h>
#include <stdlib.h>
%}


implement main0 () = () where {
	
	val t = $extfcall(int, "time", 0)
	val _ = $extfcall(void, "srand", t)

	fun loop (n: int): void = let 
		val random = $extfcall (int, "rand")
		val digits = int2list random
		val num = list2int digits
		//val _ = assertloc (num = random)
		val _ = println! ("random = ", random, " digits = ", digits, " num = ", num)
	in 
		if n > 0
		then loop (n-1)
	end

	val _ = loop 10
}
