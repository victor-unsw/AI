% ============================================================
% Bidirectional Breadth First Search
% ============================================================


s(X,Y) :- X connects Y.


solve(Start,Goal,Path) :- bfs([[Start]],[[Goal]],Path).

bfs( [[G|_]|Sublist], [[G|_]|_], [G|Sublist]).

bfs( [StartNode | StartList], [GoalNode | GoalList], Path) :-
    extend([StartNode|StartList],StartSublist),
    extend([GoalNode|GoalList],GoalSublist),
    conc(StartList,StartSublist,_),
    conc(GoalList,GoalSublist,Goal),
    checkConcurrency(StartSublist,Goal,Path), ! .

bfs( [StartNode | StartList], [GoalNode | GoalList], Path) :-
    extend([StartNode|StartList],StartSublist),
    extend([GoalNode|GoalList],GoalSublist),
    conc(StartList,StartSublist,Start),
    conc(GoalList,GoalSublist,_),
    checkConcurrency(GoalSublist,Start,Path), !.

bfs( [StartNode | StartList], [GoalNode | GoalList], Path) :-
    extend([StartNode|StartList],StartSublist),
    extend([GoalNode|GoalList],GoalSublist),
    conc(StartList,StartSublist,Start),
    conc(GoalList,GoalSublist,Goal),
    bfs(Start,Goal,Path).

extend([[Node|Path]|Paths], NewPaths) :-
findall( [NewNode,Node|Path], (s(Node,NewNode), \+ member(NewNode,[Node|Path]), \+ deepMember(NewNode,Paths)), NewPaths).


checkConcurrency([[H1|T1]|_],List,Concur) :-
        deepMember(H1,List,Result) , !, call(reverse,T1,ForwardList), conc(ForwardList,Result,Concur).

checkConcurrency([H1|L1],List,Result) :-
        checkConcurrency(L1,List,Result).

% ============================================================
% Utility Methods
% ============================================================

conc([],List,List).
conc([H|T],List,[H|Result]) :- conc(T,List,Result).



deepMember(Target,[H|_], H) :-
        member(Target,H), ! .
deepMember(Target,[_|T], Result) :-
        deepMember(Target,T,Result).