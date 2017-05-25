#include "share/atspre_staload.hats"

datatype mytree (a:t@ype) = 
| TreeLeaf of ()
| TreeNode of (a, mytree a, mytree a)


extern fun {a:t@ype} print_mytree$payload (a): void
extern fun {a:t@ype} print_mytree (mytree a): void 

overload print with print_mytree 

implement print_mytree$payload<int> (i) = print i
implement {a} print_mytree (t) = 
	case+ t of 											//+: throws error if case is not covered, -: no error (none: warning)
	| TreeLeaf () => print_string "*"
	| TreeNode (payload, left, right) => 
		(print "(";
		 print_mytree$payload<a> payload; 
		 print ", ";
		 print_mytree left;
		 print ", ";
		 print_mytree right;
		 print ")")


(* Compute the "mirror" of a given tree. It is defined as follows, 
   - An empty tree's (denoted by a sinlge leaf node) mirror is itself. 
   - A non-empty tree's mirror is obtained by swapping it's left and right mirrorred subtrees

   For instance, 
         1
      2    3
     4 5  6 7

   becomes
        1
     3    2
    7 6  5 4

*)
extern fun {a:t@ype} mirror (mytree a): mytree a 

implement {a} mirror (t) : mytree a =
	case+ t of
	| TreeLeaf () => TreeLeaf ()
	| TreeNode (payload,left,right) =>
		TreeNode(payload,mirror(right),mirror(left))



extern fun {a:t@ype} checkBinTree (mytree a): bool

implement {a} checkBinTree (t) : bool =
	case+ t of 
	| TreeLeaf () => true
	| TreeNode (payload,left,right) => 
		(	left.payload
			right.payload

		)
	

implement main0 () = () where {
	val tree = TreeNode (1, 
		TreeNode (2, 
			TreeNode (4, TreeLeaf (), TreeLeaf ()), 
			TreeNode (5, TreeLeaf (), TreeLeaf ())), 
		TreeNode (3, 
			TreeNode (6, TreeLeaf (), TreeLeaf ()), 
			TreeNode (7, TreeLeaf (), TreeLeaf ()))) : mytree int
	
	val _ = print tree
	val _ = println!("\n")
	val mirrored_tree = mirror(tree)
	val _ = print mirrored_tree
	val _ = println!("\n")
}