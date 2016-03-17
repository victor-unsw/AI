
conc([],L,L).

conc([X|L1],L2,[X|L3]) :-
	conc(L1,L2,L3).

member_new(Object,List) :-
	conc(_,[Object|_],List).

delete_last(List,NewList) :-
	conc(NewList,[_,_,_],List).
delete(List,NewList) :-
	conc([_,_,_],TempList,List),delete_last(TempList,NewList).

last1(Item,List) :-
	conc(_,[Item|[]],List).

last2([Head|[]],Head).
last2([Head|Tail],Item) :-
	last2(Tail,Item).

add(X,L,[X|L]).

delete(X,[X|Tail],Tail).
delete(X,[Head|Tail],[Head|L1]) :-
	delete(X,Tail,L1).

insert(X,List,BigList) :-
	delete(X,BigList,List).

sublist([Head|[]], [Head|Tail]).

sublist([Head|[Head2|Tail1]],[Head|[Head2|Tail2]]) :-
	sublist([Head2|Tail1],[Head2|Tail2]).

sublist(List,[Head|Tail]) :-
	sublist(List,Tail).


sub(S,L) :-
	conc(L1,L2,L),
	conc(S,L3,L2).


list_length([],0).
list_length([Head|Tail],Size+1) :-
	list_length(Tail,Size).

permutation([],[]).
permutation([X|L],P) :-
	permutation(L,L1),
	insert(X,L1,P).
