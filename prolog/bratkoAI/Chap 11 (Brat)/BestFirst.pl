% ============================================================
% Best first Search
% ============================================================
% bestfirst(Start,Solution) : Solution is a Path from Start to a goal.


bestfirst(Start,Goal,Solution) :-
    expand([],l(Start,0/0),9999,_,yes,Goal,Solution).


% case 1 : Goal leaf node.

expand(P,l(Goal,_),_,_,yes,Goal,[Goal|P]) :- !.


% case 2 : leaf-node, f-value less than Bound.

expand(P,l(N,F/G),Bound,Tree1,Solved,Goal,Solution) :-
        F =< Bound,
        (
        bagof(M/C, (N--M-->C , \+ member(M,P)),Succ),
        !,
        succList(G,Goal,Succ,Ts),
        bestf(Ts,F1),
        expand(P,t(N,F1/G,Ts),Bound,Tree1,Solved,Goal,Solution)
        ;
        Solved = never
        ).


expand(P,t(N,F/G,[T|Ts]),Bound,Tree1,Solved,Goal,Solution) :-
    F =< Bound,
    bestf(Ts,BF), min(Bound,BF,Bound1),
    expand([N|P],T,Bound1,T1,Solved1,Goal,Solution),
    continue(P,t(N,F/G,[T1|Ts]),Bound,Tree1,Solved1,Solved,Goal,Solution).


expand(_,t(_,_,[]),_,_,never,_,_) :- !.

expand(_,Tree,Bound,Tree,no,_,_) :- f(Tree,F), F > Bound.



continue(_,_,_,_,yes,yes,_,_).

continue(P,t(N,F/G,[T1|Ts]),Bound,Tree1,no,Solved,Goal,Solution) :-
    insert(T1,Ts,NTs),
    bestf(NTs,F1),
    expand(P,t(N,F1/G,NTs),Bound,Tree1,Solved,Goal,Solution).

continue(P,t(N,F/G,[_|Ts]),Bound,Tree1,never,Solved,Goal,Solution) :-
    bestf(Ts,F1),
    expand(P,t(N,F1/G,Ts),Bound,Tree1,Solved,Goal,Solution).


%--------------------------------------------------------------

succList(_,_,[],[]).

succList(G0,Goal,[N/C|NCs],Ts) :-
    G is G0 + C,
    N--Goal--->H,
    F is G + H,
    succList(G0,Goal,NCs,Ts1),
    insert(l(N,F/G),Ts1,Ts).

%--------------------------------------------------------------
% insert T into list of trees Ts

insert(T,Ts,[T|Ts]) :-
    f(T,F),bestf(Ts,F1), F =< F1, !.

insert(T,[T1|Ts],[T1|Ts1]) :-
    insert(T,Ts,Ts1).

%--------------------------------------------------------------
% Extract f-value

f(l(_,F/_),F).
f(t(_,F/_,_),F).


bestf([T|_],F) :- f(T,F).
bestf([],9999).

%--------------------------------------------------------------
% Minimum

min(X,Y,X) :- X < Y, !.
min(_,Y,Y).