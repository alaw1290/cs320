#include "share/atspre_staload.hats"


abst@ype money 

extern fun get_cent (money): int
extern fun get_dollar (money): int
extern fun make_money (dollar: int, cent: int): money

extern fun money_to_cent (money): int
extern fun cent_to_money (int): money

//patscc -tcats 07-lab.dats

//assume money = @(int,int)
//implement get_cent (m) = m.1
//implement get_dollar (m) = m.0
//implement make_money (d,c) = @(d,c)

implement money_to_cent (m) = (get_dollar m) * 100 + (get_cent m)
implement cent_to_money (c) = make_money (c/100, c % 100)

assume money = @{dollar=int, cent=int}
implement get_cent (m) = m.cent
implement get_dollar (m) = m.dollar
implement make_money (d,c) = @{dollar=d, cent=c}

abstype exp

//interface functions
extern fun get_num (exp): int
extern fun is_num (exp): bool
extern fun is_add (exp): bool
extern fun is_sub (exp): bool	

extern fun fst (exp): exp      // e.g. (pseudo) fst ("1+2") = "1"
extern fun snd (exp): exp      // e.g. (pseudo) snd ("1+2") = "2"
extern fun eval (exp): int     // please implement this

exception IllExp of ()

//abstract version of eval
implement eval(exp) =
	if is_num(exp)
		then get_num(exp)

		else if is_add(exp)
			then
				let
					val f = fst(exp) //exp type
					val s = snd(exp) //exp type
				in
					eval(f) + eval(s)
				end
				
		else if is_sub(exp)
			then
				let
					val f = fst(exp) //exp type
					val s = snd(exp) //exp type
				in
					eval(f) - eval(s)
				end

		else
			$raise IllExp ()

datatype exp_t = 
	| EXPint of (int)
	| EXPadd of (exp_t , exp_t)
	| EXPsub of (exp_t , exp_t)
assume exp = exp_t

extern fun eval2 (exp) : int
//typed version of eval
implement eval2 (exp) = 
	case+ exp of 
		| EXPint i => i
		| EXPadd (e1 , e2) => eval2 e1 + eval2 e2
		| EXPsub (e1 , e2) => eval2 e1 - eval2 e2


//typedef exp_t = '{flag = int , num = int , e1 = exp_t , e2 = exp_t}

//implement main0 () = () where {
//	val m = make_money (5, 3)
//	val _ = println! (money_to_cent m)
//}