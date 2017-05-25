#include "share/atspre_staload.hats"


BINDING ::= val NAME = EXP 
		| var NAME = EXP
		| let 

//functions

// extern: declaration in the c file
fun thename (type1, ...): rettype

//implementation
implement thename(para1, ...): rettype = EXP

implement main0 () = () where {
	
	//inner function
	fun thename (param1:type1, ...): rettype = 
		EXP

	//lambda function
	val add = lam (a:int, b:int): int => a + b //== fun add (a:int, b:int): int = a + b

	//fixed point combinator
	val fact = fix f(n:int):int => if n = 0 then 1 else n * fn(n-1)

	//cloref1
	val x = 3
	val addx = lam (a:int) : int =<cloref1> a + x // x not in the parameters of lambda, refers to x in the environment 
	val x = 4

	val _ = println! (addx 10) // will show 13 not 14 
	// note that println is void type so () = println will work as well
	// _ binding = wildcard binding will match anything 

	// val alist = 2 :: 1 :: 3 :: nil
	// val suma = list_fold (alist, lam(a,b) => a + b, 0)
	// val mula = list_fold (alist, lam(a,b) => a * b, 1)

	//bindings and types
	val a = 1
	val b = ~1
	val c = a + b
	val d = 2.0

	val abool = true
	val bbol = ~abool
	val cbool = abool && bbool
	val cbool = abool * bbool

	val x = (1,2,3, "hello") //tuple (int, int, int, string)
	val (a,b,c,d) = x //respective bindings
	val x = @{label1 = 1, label2 = "hello"} // records: mutable tuples
	val  @{label1 = a, label2 = b} = x v// a = 1, b = "hello"

	val _ = println! x.label1 // will show 1
	val _ = $showtype x //compiler will show  type of x

}