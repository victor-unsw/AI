%=====================================================================
% Substitute (work)
%=====================================================================

substitue(Term,Term,Term2,Term2).

substitue(Term,Expression,Term2,Expression2) :-
Expression =.. [F|List],
substitue_arg(Term,List,Term2,List2),
Expression2 =.. [F|List2].

substitue_arg(Term,[],Term2,[]).

substitue_arg(Term,[H|T],Term2,[Term2|Temp]) :-
atomic(H) ,
Term = H ,
!,
substitue_arg(Term,T,Term2,Temp), !.

substitue_arg(Term,[H|T],Term2,[H|Temp]) :-
atomic(H) ,
substitue_arg(Term,T,Term2,Temp), !.

substitue_arg(Term,[H|T],Term2,[Temp1|Temp2]) :-
compound(H),
substitue(Term,H,Term2,Temp1),
substitue_arg(Term,T,Term2,Temp2), !.


%=====================================================================
% Substitute (improved)
%=====================================================================

