
%==================================================================
% quick sort
%==================================================================

del(X,L,F) :-
conc(L1,[X|L2],L),
conc(L1,L2,F).

conc([],L,L).
conc([H|T],L,[H|L2]) :-
conc(T,L,L2).


quickSort([],[]).

quickSort([X|Tail],Sorted) :-
split(X,Tail,Small,Big),
quickSort(Small,SmallSorted),
quickSort(Big,BigSorted),
conc(SmallSorted,[X|BigSorted],Sorted).

split(X,[],[],[]).
split(X,[H|L],[H|Small],Big) :-
H =< X, ! , split(X,L,Small,Big).
split(X,[H|L],Small,[H|Big]) :-
split(X,L,Small,Big).



%==================================================================
% quick sort (efficient)
%==================================================================

quickestSort(List,Sorted) :-
quickSort2(List,Sorted-[]).

quickSort2([],Z-Z).
quickSort2([X|Tail],A1-Z2) :-
split(X,Tail,Small,Big),
quickSort2(Small,A1-[X|A2]),
quickSort2(Big,A2-Z2).