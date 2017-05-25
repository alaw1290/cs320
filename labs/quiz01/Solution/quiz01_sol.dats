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


implement list2int (digits) = (* your answers here *)
	list0_foldleft (digits, 0, lam (num, digit) => num * 10 + digit)

implement int2list (num) = let (* your answers here *)

	fun build (num: int): list0 int = 
		if num < 10
		then num :: nil ()
		else (num % 10) :: (build (num / 10))

in 
	list0_reverse (build num)
end


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
		val _ = assertloc (num = random)
		val _ = println! ("random = ", random, " digits = ", digits, " num = ", num)
	in 
		if n > 0
		then loop (n-1)
	end

	val _ = loop 10
}
