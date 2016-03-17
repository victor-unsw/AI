
max(X,Y,Max) :-
(X > Y, Max is X);(X<Y, Max is Y);(X=:=Y, Max is X).

max_list([Head|[]],Head).
max_list([Head|Tail],Max) :-
max_list(Tail,Temp), max(Temp,Head,Max).