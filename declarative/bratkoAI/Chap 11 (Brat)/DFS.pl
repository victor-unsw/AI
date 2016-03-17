% ============================================================
% Simple DFS
% ============================================================


s(X,Y) :- X connects Y.

path(A,A,[A]).



path(A,Z,DisplayPath) :-
    path1(A,Z,[A],Path), call(reverse,Path,DisplayPath).

path1(A,A,SubPath,SubPath) :- !.

path1(A,Z,[H|SubPath],Path) :-
    s(A,X),
    \+ member(A,SubPath),
    path1(X,Z,[X,H|SubPath],Path).