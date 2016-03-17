conc([],L,L).
conc([Head|Tail],L,[Head|Temp]) :-
conc(Tail,L,Temp).

list([],Limit,Level) :- Limit = Level, !.
list([_|Tail],Limit,Level):-
Temp is Level+1,list(Tail,Limit,Temp).

list(Var,Limit) :-
list(Var,Limit,0).

divide_list(List,List1,List2) :-
length(List,Length),
conc(List1,List2,List),
length(List1,ListLength),
Limit is Length//2,
ListLength = Limit.