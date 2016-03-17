% ============================================================
% Depth Limited Search
% ============================================================


s(X,Y) :- X connects Y.

path(A,Z,DisplayPath,MaxDepth) :-
    path1(A,Z,[A],Path, MaxDepth), call(reverse,Path,DisplayPath).

path1(A,A,SubPath,SubPath,_) :- !.

path1(A,Z,[H|SubPath],Path,MaxDepth) :-
    MaxDepth > 0,
    s(A,X),
    \+ member(A,SubPath),
    NextDepth is MaxDepth-1,
    path1(X,Z,[X,H|SubPath],Path,NextDepth).