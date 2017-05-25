(* ****** ****** *)
(*
** WordCounting
** based Divide-and-Conquer
*)
(* ****** ****** *)

(*
** HX: 20 points
** Please read code and then implement
** what is needed for WordCounting.
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

typedef word = string

(* ****** ****** *)
//
extern
fun{}
WordCounting :
  list0(word) -> list0($tup(word, int))
//
(* ****** ****** *)

#include
"$PATSHOMELOCS/effectivats-divideconquer/mylibies.hats"

(* ****** ****** *)

#staload DC = $DivideConquer

(* ****** ****** *)
//
assume $DC.input_t0ype = list0(word)
assume $DC.output_t0ype = list0($tup(word, int))
//
(* ****** ****** *)

implement
{}(*tmp*)
WordCounting(xs) = $DC.DC_solve<>(xs)

(* ****** ****** *)
//
implement
$DC.DC_base_test<>
  (xs) = not(length(xs) >= 2)
//
implement
$DC.DC_base_solve<>
  (xs) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, _) =>
  list0_cons($tup(x, 1), list0_nil())
)
//
(* ****** ****** *)

implement
$DC.DC_divide<>(xs) =
  xss where
{
  val n = length(xs)
  val xs1 =
    list0_take_exn(xs, n/2)
  val xs2 =
    list0_drop_exn(xs, n/2)
  val xss = list0_pair(xs1, xs2)
}

(* ****** ****** *)

(*
//
HX-2017-04-15:
Please implement
DC_conquer_combine
//
*)

//divide step: split them into (word,1) for every word
//combine step: merge them into (word,count) as list0($tup(word, int))

//extern fun 
//combine_word_count(w:word, c:int, lst:list0($tup(word, int)), original:list0($tup(word, int))) : list0($tup(word, int))

//implement
//combine_word_count(w,c,lst,original) = 
//  case+ lst of
//    | list0_nil() => list0_cons($tup(w, c), original)
//    | list0_cons(t,lst) => 
//        if w = t.0 
//          then combine_word_count(w,c+t.1,lst,original) 
//          else combine_word_count(w,c,lst,list0_cons(t,original))

//implement
//$DC.DC_conquer_combine<>(x0, rs) = aux(list0_concat(rs)) where {
//  fun aux(rs:list0($tup(word, int))) : list0($tup(word, int)) =
//      case+ rs of
//        | list0_nil() => list0_nil()
//        | list0_cons(r,rs) => 
//          let
//            val- list0_cons(x,xs) = combine_word_count(r.0,r.1,rs,list0_nil())
//          in
//            list0_cons(x,aux(xs))
//          end
//}

implement
$DC.DC_conquer_combine<>(x0, rs) = loop1(list0_concat(rs)) where {
  fun loop1(rs1:list0($tup(word, int))) : list0($tup(word, int)) =
      case+ rs1 of
        | list0_nil() => list0_nil()
        | list0_cons(r1,rs2) => loop2(r1.0, r1.1, rs2, list0_nil()) where {

          fun loop2(w:word, c:int, rs2:list0($tup(word, int)), filtered_rs2:list0($tup(word, int))) : list0($tup(word, int)) =
            case+ rs2 of
              | list0_nil() => list0_cons($tup(w,c), loop1(filtered_rs2))
              | list0_cons(r2,rs2) => 
                  if w = r2.0 
                    then loop2(w,c+r2.1,rs2, filtered_rs2) 
                    else loop2(w,c,rs2, list0_cons(r2,filtered_rs2))
        }
}

(* ****** ****** *)

implement
main0() = () where
{

//val
//opt =
//fileref_open_opt
//("./mobydick.txt", file_mode_r)

val
opt =
fileref_open_opt
("./WordCounting.dats", file_mode_r)

val-
~Some_vt(filr) = opt
//
val ws =
loop(nil0()) where
{
fun
loop
(
ws: list0(word)
) : list0(word) = let
  val w = fileref_get_word<>(filr)
//
  prval () = lemma_strptr_param(w)
//
in
  if strptr_is_null(w)
    then let
    prval () =
      strptr_free_null(w) in (ws)
    // end of [prval]
    end // end of [then]
    else loop(list0_cons(strptr2string(w), ws))
  // end of [if]
end // end of [loop]
}
//
val ws = list0_reverse(ws)
//
val () = fileref_close(filr)
//
val () = println! ("The words are:\n", ws)
//
val wns = WordCounting(ws)
//
val wns = list0_mergesort(wns, lam(x, y) => ~compare(x.1, y.1))
//
val () = println! ("The words are:\n", wns)
//
} (* end of [main0] *)

(* ****** ******* *)

(* end of [WordCounting.dats] *)
