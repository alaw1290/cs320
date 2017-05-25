(*
** Build one's own library
*)

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
staload
"libats/ML/SATS/list0.sats"
//
(* ****** ****** *)
//
datatype
tree0(a:t@ype) =
| tree0_nil of ()
| tree0_cons of (tree0(a), a, tree0(a))
//
#define tnil0 tree0_nil
#define tcons0 tree0_cons
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mytree_fold
(
  xs: tree0(a), fopr: (b, a, b) -<cloref1> b, sink: b
) : b // end of [mytree_fold]
//
(* ****** ****** *)

implement
{a,b}(*tmp*)
mytree_fold
(
  xs0, fopr, sink
) = let
//
fun
aux(xs: tree0(a)): b =
  case+ xs of
  | tnil0() => sink
  | tcons0(xs_l, x, xs_r) => fopr(aux(xs_l), x, aux(xs_r))
//
in
  aux(xs0)
end // end of [mytree_fold]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mytree_size(xs: tree0(a)): int
extern
fun
{a:t@ype}
mytree_height(xs: tree0(a)): int
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
mytree_size(xs) =
mytree_fold<a,int>
  (xs, lam(xs_l, _, xs_r) => xs_l+1+xs_r, 0)
//
implement
{a}(*tmp*)
mytree_height(xs) =
mytree_fold<a,int>
  (xs, lam(xs_l, _, xs_r) => 1+max(xs_l, xs_r), 0)
//
(* ****** ****** *)
extern
fun
{a:t@ype}
mytree_flatten(xs: tree0(a)): list0(a)
//
implement
{a}(*tmp*)
mytree_flatten(xs) =
mytree_fold<a,list0(a)>
( xs
, lam(xs_l, x, xs_r) =>
  list0_append(xs_l, list0_cons(x, xs_r))
, list0_nil()
) (* end of [mytree_fold] *)
//
(* ****** ****** *)

(* end of [mytree0.dats] *)
