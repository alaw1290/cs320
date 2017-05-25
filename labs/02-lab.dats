#include "share/atspre_staload.hats"

(*
EXP    ::=  ()
        |   1 | 2 | 3 | ... (numbers)
        |   1 + 2 | 3 - 4 | ... (numerical operators)
        |   true | false (boolean values)
        |   .... 
        |   aint | bint | x | y | z | ... (names)
        |   if EXP then EXP 
        |   if EXP then EXP else EXP 
        |   let BINDING* in EXP end 
        |   EXP where { BINDING* }
        |   lam (PARAM,PARAM...) => EXP (anonymous functions)
        |   fix NAME (PARAM,PARAM...) => EXP (recursive functions)
        |   (EXP; EXP; EXP ...) 
        |   NAME := EXP (variable assignments)
        ....

BINDING ::= val NAME = EXP 
         |  var NAME = EXP
         |  fun NAME (PARAM:TYPE, PARAM:TYPE ...): TYPE = EXP
         

let 
	val a = 1
	val b = 2
in 
	if a > b && a > 0
	then a - b
	else b - a 
end
*)



//fun thename (type1, type2, ...): rettype 

//implement thename (param1, param2, ...) = EXP 


implement main0 () = () where {


//	fun thename (param1:type1, param2:type2, ...): rettype = 
//		EXP

//	fun add (a:int, b:int): int = a + b

//	val add = lam (a:int, b:int):int => a + b

	val x = (1, 2, 3, "hello") // (int, int, int, string)
	val (a, b, c, d) = x  // a=1, b=2, c=3, d="hello"
	val _ = println! x.0

	val x = @{label1=1:int, label2="hello":string}
	val @{label1=a, label2=b} = x // a=1, b="hello"
	val _ = println! x.label1

	val _ = $showtype x


	val x = 3
	val addx = lam (a:int):int =<cloref1> a + x
	val x = 4
	val () = println! x

	val _ = println! (addx 10)


//	fun addktimes (k:int, n:int): int = 
//		if k = 0
//		then n 
//		else addktimes(k-1, addx(n))

//	val y = addktimes(10, 1)



	val fact = fix f(n:int):int => if n = 0 then 1 else n * f(n-1)


	val aint = 1 // 2 3
	val bint = ~1 
	val cint = aint + bint // a - b, ~a, a * b, a / b, a mod b 
	val afloat = 1.0

	val abool = true // false 
	val bbool = ~abool 
	val cbool = abool && bbool // a || b, a andalso b, a orelse b 
	val cbool = abool * bbool // abool + bbool

	val astr = "aasdadallkjl"
	val achar = 'a'
	//val alist = 1 :: 2 :: 3 :: nil // [1, 2, 3]

	var a:int = 1
	val () = a := 2 


}