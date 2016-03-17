rev_new([],Rev,Rev).
rev_new([Head|Tail],Temp,Rev) :-
rev_new(Tail,[Head|Temp],Rev).

rev_new(List,Rev) :-
rev_new(List,[],Rev).

palindrom(List) :-
rev_new(List,[],Rev), List = Rev.
