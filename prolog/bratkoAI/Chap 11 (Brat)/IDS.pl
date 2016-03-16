% ============================================================
% Iterative Deepening Depth First Search
% ============================================================


s(X,Y) :- X connects Y.

find(A,Z,DisplayPath) :-
    path(A,Z,Path,0) , call(reverse,Path,DisplayPath).

path(A,Z,Path,MaxDepth) :-
    path1(A,Z,[A],Path, MaxDepth), !
    ;
    NextDepth is MaxDepth+1,
    path(A,Z,Path,NextDepth).

path1(A,A,SubPath,SubPath,_) :- !.

path1(A,Z,[H|SubPath],Path,MaxDepth) :-
    MaxDepth > 0,
    s(A,X),
    \+ member(A,SubPath),
    NextDepth is MaxDepth-1,
    path1(X,Z,[X,H|SubPath],Path,NextDepth).