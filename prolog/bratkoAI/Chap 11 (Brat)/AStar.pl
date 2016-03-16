% ============================================================
% A*
% ============================================================


solve(Start,Goal,Solution,N) :-
    astar([[[Start],0]],Goal,Solution,1, N).

astar([BestPath|_Paths], Goal, Path, N, N) :-
    BestPath = [Path, _Cost],
    Path = [LastNode|_],
    Goal = LastNode.