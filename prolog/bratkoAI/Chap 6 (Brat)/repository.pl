
%=====================================================================
%
% Enlarging Shapes
% e.g.
% enlarge(circle(R,rectangle(S1,S2,square(S)),triangle(S1,S2,S3))) ?
%
%=====================================================================

square(Side).
rectangle(Side1,Side2).
triangle(Side1,Side2,Side3).
circle(Radius).


enlarge(Fig,Factor,Fig2) :-
Fig =.. [F|Arg],
enlarge_args(Arg,Factor,Arg2),
Fig2 =.. [F|Arg2].

enlarge_args([],Factor,[]).

enlarge_args([H|L],Factor,[Nh|Temp]) :-
atomic(H) , ! , enlarge_args(L,Factor,Temp), Nh is Factor*H.

enlarge_args([H|L],Factor,[Temp|Temp2]) :-
enlarge(H,Factor,Temp),
enlarge_args(L,Factor,Temp2).

%===============================END===================================
%=====================================================================


