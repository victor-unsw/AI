%==================================================================
% Getting elements from tree in form of list.
%==================================================================

get_elements(Tree,List) :-
Tree =.. [F|L],
get_list(L,List).

get_list([],[]).

get_list([H|L],[H|TempList]) :-
atomic(H), H \= nil , ! , get_list(L,TempList).
get_list([H|L],List) :-
atomic(H), get_list(L,List), !.
get_list([H|L],List) :-
get_elements(H,List1), get_list(L,List2), conc(List1,List2,List).


conc([],L,L).
conc([H|T],L,[H|TempList]) :-
conc(T,L,TempList).


%==================================================================
% adding element to the tree
%==================================================================



gt(X,Y) :-
number(X), number(Y), !, X > Y.
gt(X,Y) :-
atomic(X), atomic(Y), X @> Y.

% add_leaf(S,X,S1).

add_leaf(nil,X,t(nil,X,nil)).

add_leaf(t(_,X_),X,t(_,X,_)).

add_leaf(t(L,Root,R),X,t(L1,Root,R1)) :-
gt(Root,X) -> (add_leaf(L,X,L1), R1 = R)
;
(add_leaf(R,X,R1), L1 = L).


%==================================================================
% adding element to the tree
%==================================================================



% depth(X,Tree,Depth).

depth(X,t(_,X,_),0).

depth(X,t(L,Root,_),Depth) :-
X < Root, !, depth(X,L,TempDepth), Depth is TempDepth +1.

depth(X,t(_,_,R),Depth) :-
depth(X,R,TempDepth), Depth is TempDepth +1.
