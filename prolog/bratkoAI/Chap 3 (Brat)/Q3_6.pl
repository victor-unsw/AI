conc([],List,List).
conc([Head|Tail],List2,[Head|Temp]) :-
conc(Tail,List2,Temp).

shift([Head|Tail],List) :-
conc(Tail,[Head|[]],List).

