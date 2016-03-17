% ============================================================
% Breadth First Search
% ============================================================


s(X,Y) :- X connects Y.

solve(Start,Goal,Result) :- bfs([[Start]], Goal,[Path|_]), call(reverse,Path,Result).

bfs( [[H|T] | L], H , [[H|T] | L] ) :- !.

bfs( [Path|Paths], Goal, Result) :-
        extend(Path,NewPaths),
        conc(Paths,NewPaths,Queue),
        bfs(Queue,Goal,Result).

extend([Node|Path], NewPaths) :-
        findall( [NewNode,Node|Path], (s(Node,NewNode), \+ member(NewNode,[Node|Path]) ), NewPaths).


% ============================================================
% Utility Methods
% ============================================================

conc([],List,List).
conc([H|T],List,[H|Result]) :- conc(T,List,Result).