
list_length([],0).
list_length([Head|Tail],Size+1) :-
	list_length(Tail,Size).

evenlength(List) :-
	list_length(List,Size),
	S is Size mod 2,
	S is 0.
oddlength(List) :-
	list_length(List,Size),
	S is Size mod 2,
	S \= 0.