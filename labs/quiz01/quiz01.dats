


(*
datatype list0 (a:t@ype) = 
| list0_cons of (a, list0 a)
| list0_nil  of ()
*)

(* 
	5 points
	
	Turn a NATURAL number to a list of digits
	representing this natural number

	e.g. 123 => 1 :: 2 :: 3 :: nil 
*)
extern fun int2list (int): list0 int 

(* 
    5 points
    (10 points if implemented using fold)

	Turn a list of digits representing a 
	natural number into that natural number 

	e.g. 1 :: 2 :: 3 :: nil => 123 
*)
extern fun list2int (list0 int): int