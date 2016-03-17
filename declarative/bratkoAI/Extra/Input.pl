
% ---------------------------------------------------------------------
%                           EXAM PREPERATION
% ---------------------------------------------------------------------


% is_member(Var,List).

is_member(X,[X|_]).

is_member(X,[_|T]) :-
        is_member(X,T).



% is_member_c(Var,List).        -- member implementation by concatenate

is_member_c(X,List) :- concatenate(_,[X|_],List).








% concatenate(List1,List2,FinalList).

concatenate([],List,List).

concatenate([H1|T1], List2, [H1|FinalList]) :-
    concatenate(T1, List2, FinalList).








% last(Item,List). -- simple version

last(X,[X|[]]).
last(X,[_|T]) :- last(X,T).


% last(Item,List). -- concatenate version

last_c(X,List) :- concatenate(_,[X|[]],List).







% first(Item,List).

first(X,[X|_]).
first(X,[]).









% add(X,List,FinalList).

add_to_front(X,L,[X|L]).

add_to_rear(X,[H|[]],[H,X]).
add_to_rear(X,[H|T],[H|L]) :-
            add_to_rear(X,T,L).









% delete_from_list(Item,List,FinalList).

delete_from_list(X,[X|T],T).

delete_from_list(X,[H|T],[H|List]) :-
        delete_from_list(X,T,List).

% delete_from_list(Item,List,FinalList). --- concatenate version

delete_from_list_c(X,List,FinalList) :-
        concatenate(List1,[X|List2],List), concatenate(List1,List2,FinalList).


insert_to_list(X,List,FinalList) :-
        delete_from_list(X,FinalList,List).







% sublist(List1,List2).

sublist(Sub,List) :-
        concatenate(List1,List2,List),
        concatenate(Sub,List3,List2).







% evenlength(List).             -- true if length of list is true.

evenlength(List) :-
        list_length(List,Length), Length mod 2 =:= 0.

oddlength(List) :-
        list_length(List,Length), \+ 0 is Length mod 2.

list_length([],0).
list_length([H|T],Length) :-
        list_length(T,TempLength), Length = TempLength+1.








% reverse(List,ReversedList).               -- reverses the List

reverse(List,ReversedList) :-
        reverse(List,[],ReversedList).

reverse([],TempList,TempList).

reverse([H|T],TempList,ReversedList) :-
        reverse(T,[H|TempList],ReversedList).








% palindrom(List).              -- [m,a,d,a,m].


palindrom(List) :-
    length(List,Length),
    MidPoint is Length//2,
    forward_list(List,MidPoint,ForwardList),
    (
        (
            evenlength(List),
            concatenate(ForwardList,RearList,List)
        )
    ;
        (
            oddlength(List),
            concatenate(ForwardList,[H|RearList],List)
        )
    ),
    reverse(ForwardList,RearList).


% forward_list(List,Counter,NewList).

forward_list(_,Counter,[]) :- Counter =< 0, !.

forward_list([H|T],Counter,[H|List]) :-
        Decrement is Counter-1,
        forward_list(T,Decrement,List).










% shift(List1,List2).           ---- List2 is List1 'shifted rotationally' by one element to the left.

shift([H|T],List2) :-
    shift(T,H,List2).

shift([],E,[E]).

shift([H|T],E,[H|List]) :-
        shift(T,E,List).














% translate([3,5,1,3],[three,five,one,three]).

means(0,zero).
means(1,one).
means(2,two).
means(3,three).
means(4,four).
means(5,five).
means(6,six).
means(7,seven).
means(8,eight).
means(9,nine).

translate([],[]).

translate([H|T],[Var|List]) :-
        translate(T,List), means(H,Var).









%divideList(List,List1,List2).          -- list1 & List2 are of equal Length

divideList(List,List1,List2) :-
        length(List,Length),
        Counter is Length//2,
        forward_list(List,Counter,List1),
        concatenate(List1,List2,List).






% flatten(List,FlatList).           flatten([a,b,[c,d],[],[[[e]]],f],FlatList).

flatten([],[]).

flatten([H|[]],[H]) :- atomic(H), !.

flatten([H|T],[H|List]) :- atomic(H), flatten(T,List), !.

flatten([H|T],FlatList) :-
    flatten(H,List1), flatten(T,List2), concatenate(List1,List2,FlatList), !.








% deepListCount([a, [b, c], [[d], e], f], Count).

deepListCount([],0) :- !.

deepListCount([H|T],Count):-
        atomic(H),
        deepListCount(T,TempCount),
        Count is TempCount+1, !.

deepListCount([H|T],Count) :-
        deepListCount(H,TempCount1),
        deepListCount(T,TempCount2),
        Count is (TempCount1+TempCount2).








