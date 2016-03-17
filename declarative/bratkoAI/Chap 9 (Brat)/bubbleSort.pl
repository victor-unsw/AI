
%==================================================================
% bubble sort
%==================================================================

bubbleSort(List,Sorted) :-
swap(List,List1),
!,
bubbleSort(List1,Sorted).

bubbleSort(Sorted,Sorted).

gt(X,Y) :- X > Y.

swap([X,Y|Rest],[Y,X|Rest]) :-
gt(X,Y).
swap([Z|Rest],[Z|Rest1]) :-
swap(Rest,Rest1).





