conc([],L,L).
conc([Head|Tail],L,[Head|Temp]) :-
conc(Tail,L,Temp).

set_difference([],Set,[]).
set_difference([H|T],Set,Difference) :-
not(member(H,Set)),proper_candidates(T,Set,Temp),conc([H],Temp,Difference),!
;
proper_candidates(T,Set,Difference).
