% ============================================================
% Breadth First Search
% - deepMember search is injected in 'extend' predicate i.e. only shallowed member will exist.
% -
% ============================================================


s(X,Y) :- X connects Y.

solve(Start,Goal,Result) :- bfs([[Start]], Goal,[Path|_]), call(reverse,Path,Result).

bfs( [[H|T] | L], H , [[H|T] | L] ) :- !.

bfs( [Path|Paths], Goal, Result) :-
extend([Path|Paths],NewPaths),
conc(Paths,NewPaths,Queue),
bfs(Queue,Goal,Result).

extend([[Node|Path]|Paths], NewPaths) :-
    findall( [NewNode,Node|Path], (s(Node,NewNode), \+ member(NewNode,[Node|Path]), \+ deepMember(NewNode,Paths)), NewPaths).


% ============================================================
% Utility Methods
% ============================================================

conc([],List,List).
conc([H|T],List,[H|Result]) :- conc(T,List,Result).



deepMember(Target,[H|T]) :-
    member(Target,H), ! ;  deepMember(Target,T).