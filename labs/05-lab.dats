#include "share/atspre_staload.hats"

(* Datatype Tree *)
datatype tree (a:t@ype) = 
| Node of (tree a, a, tree a)
| Leaf of ()

(* Main Function Template for Users *)
extern fun {a:t@ype} print_tree (tree a): void 

(* Knobs of the Template *)
extern fun {a:t@ype} print_tree$node (a): void
extern fun {}        print_tree$leaf (): void
extern fun {a:t@ype} print_tree$order (tree a, a, tree a): void

(* Default Implementations of the Knobs *)
implement print_tree$node<int> (n)        = print_int n
implement print_tree$node<string> (s)     = print_string s
implement print_tree$leaf<> ()            = print_string "*"
implement {a} print_tree$order (l, p, r)  = (print_tree<a> l; print_tree$node<a> p; print_tree<a> r)

(* Default Implementation of Main Function Template *)
implement {a} print_tree (t) = 
	case+ t of 
	| Leaf ()        => print_tree$leaf<> ()
	| Node (l, p, r) => print_tree$order<a> (l, p, r)


implement main0 () = () where {
	fun term (n:int): tree int = Node(Leaf(), n, Leaf())
	val t = Node(Node(term(1), 2, term(3)), 4, Node(term(5), 6, term(7)))

	(* Before callsite, you can tune those knobs by providing new implementations *)
	implement print_tree$leaf<> () = print_string "_"

	val _ = print_tree<int> t
	val _ = println! ()
}