(* ****** ****** *)

(*
** Midterm-1:
** mylist_permute_succ: 20 points
*)

(* ****** ****** *)

staload
"./../../midterm-1.dats"

(* ****** ****** *)

(*
implement
mylist_permute_succ(xs) = ...
*)

(* ****** ****** *)

implement
main0 () =
{
//
val () =
println!
("Testing for mylist_permute_succ")
//
val xs0 =
g0ofg1($list{int}(0,1,2,3,4))
val-Some(xs1) = mylist_permute_succ(xs0)
val-Some(xs2) = mylist_permute_succ(xs1)
//
val () = println! ("xs1 = ", xs1)
val () = println! ("xs2 = ", xs2)
//
val ys0 =
g0ofg1($list{int}(4,3,2,1,0))
val-None((*void*)) = mylist_permute_succ(ys0)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist_permute_succ] *)
