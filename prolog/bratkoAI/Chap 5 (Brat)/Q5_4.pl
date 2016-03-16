conc([],L,L).
conc([Head|Tail],L,[Head|Temp]) :-
conc(Tail,L,Temp).

proper_candidates([],Ruledout,[]).

proper_candidates([H|T],RuledOut,Proper) :-
not(member(H,RuledOut)),proper_candidates(T,RuledOut,Temp), conc([H],Temp,Proper),!
;
proper_candidates(T,RuledOut,Proper).
