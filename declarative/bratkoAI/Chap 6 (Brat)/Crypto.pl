
assign( Digs, D)  :-
    del( D, Digs,Digs1).


summation([],[],[],0).

summation([H1|T1],[H2|T2],[H|Temp],Digs,Cp) :-
    assign(Digs,H1),
    assign(Digs,H2),
    summation(T1,T2,Temp,TCp),
    S is (H1+H2+TCp),
    H is S mod 10,
    Cp is S//10.

summation(L1,L2,L,Digs) :-
    summation(L1,L2,L,Digs,Cp).


del(E,L,R) :-
conc(T1,[E|T2],L),conc(T1,T2,R).

conc([],L,L).
conc([H|L1],L,[H|Temp]) :-
conc(L1,L,Temp).



% Solving Cryptarithmetic puzzles

sum(N1,N2,N):-
    sum1(N1,N2,N,0,0,[0,1,2,3,4,5,6,7,8,9],_).

sum1([],[],[],C,C,Digits,Digits).

sum1([D1|N1],[D2|N2],[D|N],C1,C,Digs1,Digs) :-
    sum1(N1,N2,N,C1,C2,Digs1,Digs2),
    digitsum(D1,D2,C2,D,C,Digs2,Digs).

