(* ****** ****** *)
//
#include
"./../assign07.dats"
//
(* ****** ****** *)
//
// Please give your implementation here
//
(* ****** ****** *)

extern
fun
{a,st:t@ype}
mystream_make_cloref
  (st0: st, fopr: (st) -<cloref1> @(a, st)): stream(a)
  //
implement
{a,st}
mystream_make_cloref
    (st0, fopr) = let
//
fun
aux
(
st: st
) : stream(a) = $delay
(
let
val(x, st) = fopr(st)
in
stream_cons(x, aux(st))
end
)
//
in
  aux(st0)
end // end of [mystream_make_cloref]

(* ****** ****** *)

local
//
typedef a = double
typedef st =
  (int(*sgn*), int(*n*), double(*psum*))
//
val
st0 = (1, 1, 0.0)
fun
fopr(st: st): @(a, st) =
(
  st.2
, (~(st.0), st.1+1, st.2 + 1.0 * st.0 / st.1)
) (* end of [fopr] *)
//
in (* in-of-local *)
//
implement
stream_ln2() =
mystream_make_cloref<a,st>(st0, lam(st) => fopr(st))
//
end // end of [local]

(* ****** ****** *)

implement
intpair_enumerate
  ((*void*)) = let
//
typedef a = int2
typedef st = (int(*i*), int(*j*))
//
val
st0 = (0, 0)
//
fun
fopr
(
  st: st
) : (a, st) = let
  val i = st.0 and j = st.1
in
//
if i <= j
  then ((i, j), (i+1, j-1)) else fopr((0, i+j+1))
// end of [if]
//
end // end of [fopr]
//
in
  mystream_make_cloref<a, st>(st0, lam(st) => fopr(st))
end // end of [intpair_enumerate]

(* ****** ****** *)

#ifdef
MAIN_NONE
#then
#else
implement
main0 () =
{
//
val () =
println!
(
  "Hello from [assign07_sol]!"
) (* val *)
//
val ln2_1M =
stream_nth_exn (stream_ln2(), 1000000)
val () = println! ("ln2_1M = ", ln2_1M)
//
val xys =
  intpair_enumerate()
val xys_10 = stream_take_exn(xys, 10)
val xys_10 = list0_of_list_vt(xys_10)
//
val () = println! ("xys_10 = ", xys_10)
//
val ln2 = stream_ln2()
(*
val ln2 = EulerTrans(ln2)
val ln2 = EulerTrans(ln2)
val ln2 = EulerTrans(ln2)
val ln2 = EulerTrans(ln2)
val () = println! ("ln2_4_0 = ", stream_nth_exn(ln2, 0))
*)
//
val () = println! ("Good news: Your code has passed initial testing!")
//
} (* end of [main0] *)
#endif // #ifdef

(* ****** ****** *)

(* end of [assign07_sol.dats] *)
