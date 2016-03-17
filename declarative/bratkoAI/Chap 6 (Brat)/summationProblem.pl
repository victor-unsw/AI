modifyx([H|T],Value,[],H2) :-
NewHead is Value*10+H,
conc([NewHead],T,NewList).




summation([],[],[],0).

summation([H1|T1],[H2|T2],[H|Temp],Cp) :-
summation(T1,T2,Temp,TCp),
S is (H1+H2+TCp),
H is S mod 10,
Cp is S//10.

summation(L1,L2,L,Fl) :-
summation(L1,L2,L,Cp),
conc([Cp],L,Fl).

conc([],L,L).
conc([H|L1],L,[H|T]) :-
conc(L1,L,T).
