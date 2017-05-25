#include "share/atspre_staload.hats"


//patscc -DATS_MEMALLOC_LIBC 03-lab.dats

datatype mytree (a:t@ype) = 
| TreeLeaf of ()
| TreeNode of (a, mytree a, mytree a)


extern fun {a:t@ype} print_mytree$payload (a): void
extern fun {a:t@ype} print_mytree (mytree a): void 

overload print with print_mytree 

implement print_mytree$payload<int> (i) = print i
implement {a} print_mytree (t) = 
	case+ t of 
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

implement {a} mirror (t) = 
	case+ t of 
	| TreeLeaf () => TreeLeaf () // t
	| TreeNode (payload, left, right) => TreeNode (payload, mirror (right), mirror (left))
 




implement main0 () = () where {
	val tree = TreeNode (1, TreeNode (2, TreeLeaf (), TreeLeaf ()), TreeNode (3, TreeLeaf (), TreeLeaf ())) : mytree int
	val _ = print tree
}