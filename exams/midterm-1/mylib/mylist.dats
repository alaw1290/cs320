(*
** Build one's own library
*)

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

(* ****** ****** *)

(*
//
datatype
list0(a:t@ype) =
| list0_nil of ()
| list0_cons of (a, list0(a))
//
#define nil0 list0_nil
#define :: list0_cons
#define cons0 list0_cons
//
*)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_head(list0(a)): (a)
extern
fun
{a:t@ype}
mylist_tail(list0(a)): list0(a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_head(xs) =
(
  case- xs of list0_cons(x, _) => x
)
implement
{a}(*tmp*)
mylist_tail(xs) =
(
  case- xs of list0_cons(_, xs) => xs
)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_length(list0(a)): int
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_length(xs) = let
//
fun loop(xs: list0(a), res: int): int =
  case+ xs of
  | list0_nil() => res | list0_cons(_, xs) => loop(xs, res+1)
//
in
  loop(xs, 0)
end // end of [mylist_length]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_make_elt(n: int, x: a): list0(a)
//
implement
{a}(*tmp*)
mylist_make_elt
  (n, x) = let
//
fun
aux
(
  n: int, res: list0(a)
) : list0(a) =
(
if n > 0
  then aux(n-1, list0_cons(x, res)) else res
) (* end of [aux] *)
//
in
  aux(n, list0_nil((*void*)))
end // end of [mylist_make_elt]
//
(* ****** ****** *)
//
extern
fun{}
mylist_make_intrange
  (m: int, n: int): list0(int)
//
implement
{}(*tmp*)
mylist_make_intrange
  (m, n) = let
//
fun
aux
(
  n: int, res: list0(int)
) : list0(int) =
(
if n > m
  then aux(n-1, list0_cons(n-1, res)) else res
)
//
in
  aux(n, list0_nil((*void*)))
end // end of [mylist_make_intrange]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_append : (list0(a), list0(a)) -> list0(a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_append
  (xs, ys) = let
//
fun
append
(
  xs: list0(a), ys: list0(a)
) : list0(a) =
  case+ xs of
  | list0_nil() => ys
  | list0_cons(x, xs) => list0_cons(x, append(xs, ys))
//
in
  append(xs, ys)
end // end of [mylist_append]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_reverse : (list0(a)) -> list0(a)
extern
fun
{a:t@ype}
mylist_revappend : (list0(a), list0(a)) -> list0(a)
//
(* ****** ****** *)
//
implement
{a}
mylist_reverse(xs) = 
mylist_revappend<a>(xs, list0_nil())
//
implement
{a}
mylist_revappend(xs, ys) = let
//
fun
revappend
(
  xs: list0(a), ys: list0(a)
) : list0(a) =
  case+ xs of
  | list0_nil() => ys
  | list0_cons(x, xs) =>
      revappend(xs, list0_cons(x, ys))
    // end of [list0_cons]
//
in
  revappend(xs, ys)
end // end of [mylist_append]

(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_insort(xs: list0(a)): list0(a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_insort
  (xs) = let
//
fun
insord
(
  xs: list0(a), x0: a
) : list0(a) = (
//
case+ xs of
| nil0() =>
  cons0(x0, nil0)
| cons0(x1, xs2) => let
    val sgn =
    gcompare_val_val<a> (x0, x1)
  in
    if sgn <= 0
      then cons0(x0, xs)
      else cons0(x1, insord(xs2, x0))
    // end of [if]
  end // end of [cons0]
//
) (* insord *)
//
in
//
case+ xs of
| nil0() => nil0()
| cons0(x, xs) =>
  (
    insord(mylist_insort(xs), x)
  )
//
end // end of [mylist_insort]

(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_quicksort(xs: list0(a)): list0(a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_quicksort(xs) = let
//
fun
qsort
(
  xs: list0(a)
) : list0(a) =
(
case+ xs of
| nil0() => nil0()
| cons0(x, xs) => qpart(x, xs, nil0(), nil0())
)
//
and
qpart
(
  x0: a
, xs: list0(a)
, left: list0(a), right: list0(a)
) : list0(a) =
(
case+ xs of
| nil0() => let
    val left = qsort(left)
    val right = qsort(right)
  in
    mylist_append(left, cons0(x0, right))
  end // end of [nil0]
| cons0(x1, xs2) => let
    val sgn = gcompare_val_val<a> (x1, x0)
  in
    if sgn <= 0
      then qpart(x0, xs2, cons0(x1, left), right)
      else qpart(x0, xs2, left, cons0(x1, right))
    // end of [if]
  end // end of [cons0]
)
//
in
  qsort(xs)
end // end of [mylist_quicksort]

(* ****** ****** *)

extern
fun{a:t@ype}
mylist_take(xs: list0(a), n:int): list0(a)
extern
fun{a:t@ype}
mylist_drop(xs: list0(a), n:int): list0(a)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_take
  (xs, n) = (
//
if
n > 0
then let
  val-list0_cons(x, xs) = xs
in
  list0_cons(x, mylist_take(xs, n-1))
end // end of [then]
else list0_nil() // end of [else]
//
) (* end of [mylist_take] *)

(* ****** ****** *)

implement
{a}(*tmp*)
mylist_drop
  (xs, n) = (
//
if
n > 0
then let
  val-list0_cons(x, xs) = xs
in
  mylist_drop(xs, n-1)
end // end of [then]
else xs // end of [else]
//
) (* end of [mylist_drop] *)

(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_split(xs: list0(a)): (list0(a), list0(a))
//
(* ****** ****** *)
(*
//
implement
{a}(*tmp*)
mylist_split(xs) = let
//
fun
aux
(
  xs: list0(a)
, ys: list0(a), zs: list0(a)
) : (list0(a), list0(a)) = (
//
case+ xs of
| list0_nil() => (ys, zs)
| list0_cons(x1, xs) =>
  (
    case+ xs of
    | list0_nil() =>
      (list0_cons(x1, ys), zs)
    | list0_cons(x2, xs) => let
        val ys = list0_cons(x1, ys)
        val zs = list0_cons(x2, zs)
      in
        aux(xs, ys, zs)
      end
  )
)
//
val (ys, zs) =
  aux(xs, list0_nil(), list0_nil())
//
in
  (mylist_reverse(ys), mylist_reverse(zs))
end // end of [mylist_split]
//
*)
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_split(xs) = let
  val n = mylist_length<a>(xs)
  val n2 = n/2
  val ys = mylist_take(xs, n-n2)
  val zs = mylist_drop(xs, n-n2)
in
  (ys, zs)
end // end of [mylist_split]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_mergesort
  (xs: list0(a)): list0(a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_mergesort
  (xs) = let
//
fun
merge
(
  ys: list0(a), zs: list0(a)
) : list0(a) =
(
case+ ys of
| list0_nil() => zs
| list0_cons(y, ys2) =>
  (
    case+ zs of
    | list0_nil() => ys
    | list0_cons(z, zs2) => let
        val sgn =
        gcompare_val_val<a> (y, z)
      in
        if sgn <= 0
          then list0_cons(y, merge(ys2, zs))
          else list0_cons(z, merge(ys, zs2))
        // end of [if]
      end // end of [list0_cons]
  )
)
//
in
//
case+ xs of
| list0_nil() => xs
| list0_cons(_, xs2) =>
  (
    case+ xs2 of
    | list0_nil() => xs
    | list0_cons(_, _) => let
        val (ys, zs) = mylist_split(xs)
        val ys = mylist_mergesort(ys)
        and zs = mylist_mergesort(zs)
      in
        merge(ys, zs)
      end
  )
end // end of [mylist_mergesort]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_filter
  (xs: list0(a), p: (a) -<cloref1> bool): list0(a)
//
implement
{a}(*tmp*)
mylist_filter
  (xs, p) = let
//
fun
aux(xs: list0(a)): list0(a) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) =>
    if p(x) then list0_cons(x, aux(xs)) else aux(xs)
  // end of [list0_cons]
)
//
in
  aux(xs)
end // end of [mylist_filter]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_foreach
  (xs: list0(a), fwork: (a) -<cloref1> void): void
//
implement
{a}(*tmp*)
mylist_foreach
  (xs, fwork) = let
//
fun
loop(xs: list0(a)): void =
(
  case+ xs of
  | list0_nil() => () | list0_cons(x, xs) => (fwork(x); loop(xs))
)
//
in
  loop(xs)
end // end of [mylist_foreach]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mylist_foldleft
  (xs: list0(a), init: b, fopr: (b, a) -<cloref1> b): b
//
implement
{a,b}(*tmp*)
mylist_foldleft
  (xs, init, fopr) = let
//
fun
aux(xs: list0(a), init: b): b =
(
case+ xs of
| list0_nil() => init
| list0_cons(x, xs) => aux(xs, fopr(init, x))
)
//
in
  aux(xs, init)
end // end of [mylist_foldleft]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mylist_foldright
  (xs: list0(a), fopr: (a, b) -<cloref1> b, sink: b): b
//
implement
{a,b}(*tmp*)
mylist_foldright
  (xs, fopr, sink) = let
//
fun
aux(xs: list0(a), sink: b): b =
(
case+ xs of
| list0_nil() => sink
| list0_cons(x, xs) => fopr(x, aux(xs, sink))
)
//
in
  aux(xs, sink)
end // end of [mylist_foldright]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mylist_zip
  (xs: list0(a), ys: list0(b)): list0(@(a, b))
//
implement
{a,b}
mylist_zip
  (xs, ys) = let
//
fun
aux
(
  xs: list0(a), ys: list0(b)
) : list0(@(a, b)) =
(
case+ (xs, ys) of
| (list0_nil(), _) => list0_nil()
| (_, list0_nil()) => list0_nil()
| (list0_cons(x, xs),
   list0_cons(y, ys)) => list0_cons((x, y), aux(xs, ys))
)
//
in
  aux(xs, ys)
end // end of [mylist_zip]

(* ****** ****** *)
//
(*
extern
fun
{a,b:t@ype}
mylist_fold_split
(
  xs: list0(a)
, fopr: (b, b) -<cloref1> b, sink0: b, fsink1: (a) -<cloref1> b
) : b // end of [mylist_fold_split]
*)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_find_left
  (xs: list0(a), p: (a) -<cloref1> bool): option0(a)
//
implement
{a}(*tmp*)
mylist_find_left
  (xs, p) = let
//
exception
Found_find_left of (a)
//
in
//
try
mylist_foldleft<a,option0(a)>
(
  xs, None0()
, lam(opt, x) =>
  if p(x) then $raise(Found_find_left(x)) else opt
) (* mylist_foldleft *)
with ~Found_find_left(x) => Some0(x)
//
end // end of [mylist_find_left]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_find_right
  (xs: list0(a), p: (a) -<cloref1> bool): option0(a)
//
implement
{a}(*tmp*)
mylist_find_right
  (xs, p) = let
//
exception
Found_find_right of (a)
//
in
//
try
mylist_foldright<a,option0(a)>
(
  xs
, lam(x, opt) =>
  if p(x) then $raise(Found_find_right(x)) else opt
, None0()
) (* mylist_foldright *)
with ~Found_find_right(x) => Some0(x)
//
end // end of [mylist_find_right]
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_get_at
  (xs: list0(a), n: int): a
//
implement
{a}
mylist_get_at(xs, n) =
  mylist_head(mylist_drop(xs, n))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_set_at
  (xs: list0(a), n: int, x0: a): list0(a)
//
implement
{a}
mylist_set_at
  (xs, n, x0) = let
  val xs1 = mylist_take(xs, n)
  val xs2 = mylist_drop(xs, n)
in
  mylist_append(xs1, list0_cons(x0, mylist_tail(xs2)))
end // end of [mylist_set_at]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mylist_ifoldleft
  (xs: list0(a), init: b, fopr: (b, int, a) -<cloref1> b): b
//
implement
{a,b}(*tmp*)
mylist_ifoldleft
  (xs, init, fopr) = let
//
fun
aux(xs: list0(a), i: int, init: b): b =
(
case+ xs of
| list0_nil() => init
| list0_cons(x, xs) => aux(xs, i+1, fopr(init, i, x))
)
//
in
  aux(xs, 0, init)
end // end of [mylist_ifoldleft]
//
(* ****** ****** *)
//
extern
fun
{a,b,c:t@ype}
mylist2_foldleft
(
  xs: list0(a), ys: list0(b)
, init: c, fopr: (c, a, b) -<cloref1> c
) : (c) // mylist2_foldleft
//
implement
{a,b,c}
mylist2_foldleft
  (xs, ys, init, fopr) = let
//
fun
aux
(
  xs: list0(a), ys: list0(b), init: c
) : c =
(
case+ (xs, ys) of
| (nil0(), _) => init
| (_, nil0()) => init
| (cons0(x, xs), cons0(y, ys)) => aux(xs, ys, fopr(init, x, y))
)
//
in
  aux(xs, ys, init)
end // end of [mylist2_foldleft]

(* ****** ****** *)
//
extern
fun
{a,b,c:t@ype}
mylist2_foldright
(
  xs: list0(a), ys: list0(b)
, fopr: (a, b, c) -<cloref1> c, sink: c
) : (c) // mylist2_foldright
//
implement
{a,b,c}
mylist2_foldright
  (xs, ys, fopr, sink) = let
//
fun
aux(xs: list0(a), ys: list0(b)): c =
(
case+ (xs, ys) of
| (list0_nil(), _) => sink
| (_, list0_nil()) => sink
| (list0_cons(x, xs),
   list0_cons(y, ys)) => fopr(x, y, aux(xs, ys))
) (* end of [aux] *)
//
in
  aux(xs, ys)
end // end of [mylist2_foldright]

(* ****** ****** *)

(* end of [mylist.dats] *)
