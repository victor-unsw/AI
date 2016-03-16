
%==================================================================
% insertion sort
%==================================================================

gt(X,Y) :-
X > Y.

insertionSort([],[]).

insertionSort([H|T],Sorted) :-
insertionSort(T,SortedTail),
insert(H,SortedTail,Sorted), !.

insert(X,[H|T],[H|TempSorted]) :-
H < X, ! ,
insert(X,T,TempSorted).

insert(X,Sorted,[X|Sorted]).
