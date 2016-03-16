
conc([],List,List).
conc([Head|Tail],List2,[Head|Temp]) :-
conc(Tail,List2,Temp).



flatten([],[]).
flatten([[]|Tail],List) :-
    flatten(Tail,List). %,conc([],Temp,List).
flatten([[H|T]|Tail],List) :-
    (flatten(Tail,Temp), flatten([H|T],Temp2),conc(Temp2,Temp,List)),!.
flatten([Head|Tail],List) :-
    flatten(Tail,Temp), conc([Head],Temp,List).

% Ask teacher why are more combinations generated after single correct answer,
% main purpose is to understand the mechanism of backtracking when we remove cut(!).