%=====================================================================
% Q 9.5.1
%=====================================================================

binarytree(t(Left,Root,Right)) :-
check_node(Left),
check_node(Right),
atomic(Root).

check_node(Node) :-
compound(Node) -> binarytree(Node) ; Node = nil.

%=====================================================================
% Q 9.5.2
%=====================================================================

grt(X,Y) :-
number(X),number(Y), X > Y, !.
grt(X,Y) :-
X @> Y.


dictonary(Tree) :-
dictonary(Tree,Root).

dictonary(t(Left,Root,Right),Root) :-
check_left_node(Left,Root),
check_right_node(Right,Root),
atomic(Root).

check_left_node(Node,Root) :-
compound(Node) -> (dictonary(Node,NodeRoot), grt(Root,NodeRoot)); Node = nil.


check_right_node(Node,Root) :-
compound(Node) -> (dictonary(Node,NodeRoot), grt(NodeRoot,Root)); Node = nil.