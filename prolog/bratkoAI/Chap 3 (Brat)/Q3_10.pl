
equal_length([],[]).
equal_length([Head|Tail],[Head2|Tail2]) :-
equal_length(Tail,Tail2).