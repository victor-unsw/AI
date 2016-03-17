

time(0..60).



1 { does(M,T) : move_domain(M) } 1 :- time(T), not terminal(T). 


:- does(move(X,Y),T), not legal(move(X,Y),T).
:- 0{ terminal(T) : time(T)}0.



move_domain(move(X,Y)) :- coord_x(X) , coord_y(Y).
coord_x(X) :- succ_x(X,U) ; pred_x(X,U).
coord_y(Y) :- succ_y(Y,U) ; pred_y(Y,U).



% initial state
holds(cell(1,1,2),0).
holds(cell(1,2,1),0).
holds(cell(2,1,b),0).
holds(cell(2,2,3),0).
holds(cell(3,1,4),0).
holds(cell(3,2,5),0).
holds(step(0),0).

% adjacency
succ_x(1,2).
succ_x(2,3).
pred_x(2,1).
pred_x(3,2).
succ_y(1,2).
pred_y(2,1).



% legal moves
legal(move(X,Y),T) :-
	holds(cell(U,Y,b),T),
	succ_x(X,U).

legal(move(X,Y),T) :-
	holds(cell(U,Y,b),T),
	pred_x(X,U).

legal(move(X,Y),T) :-
	holds(cell(X,V,b),T),
	succ_x(Y,V).
legal(move(X,Y),T) :-
	holds(cell(X,V,b),T),
	pred_x(Y,V).



% next states


% next step number
holds(step(X),T+1) :-
	holds(step(Y),T),
	successor(Y,X).

% make the cell blank
holds(cell(X,Y,b),T+1) :-
	does(move(X,Y),T).

% mark the cell as ‘z’
holds(cell(X,Y,Z),T+1) :-
	does(move(X,Y),T),
	holds(cell(U,Y,b),T),
	holds(cell(X,Y,Z),T),
	Z != b.

holds(cell(X,Y,Z),T+1) :-
	does(move(X,Y),T),
	holds(cell(X,V,b),T),
	holds(cell(X,Y,Z),T),
	Z != b.

holds(cell(U,V,Z),T+1) :-
	holds(cell(U,V,Z),T),
	does(move(X,Y),T),
	X!=U,
	holds(cell(X1,Y1,b),T),
	X1!=U.

holds(cell(U,V,Z),T+1) :-
	holds(cell(U,V,Z),T),
	does(move(X,Y),T),
	Y!=V,
	holds(cell(X1,Y1,b),T),
	Y1!=V.


% Goal

goal(100,T) :-
	holds(step(30),T).

goal(99,T) :-
	holds(step(X),T),
	holds(cell(1,1,1),T),
	holds(cell(1,2,2),T),
	X != 30.


terminal(T) :-
	holds(cell(1,1,1),T),
	holds(cell(1,2,2),T).

terminal(T) :-
	holds(step(61),T).



% data

successor(0,1).
successor(1,2).
successor(2,3).
successor(3,4).
successor(4,5).
successor(5,6).
successor(6,7).
successor(7,8).
successor(8,9).
successor(9,10).
successor(10,11).
successor(11,12).
successor(12,13).
successor(13,14).
successor(14,15).
successor(15,16).
successor(16,17).
successor(17,18).
successor(18,19).
successor(19,20).
successor(21,22).
successor(22,23).
successor(23,24).
successor(24,25).
successor(25,26).
successor(26,27).
successor(27,28).
successor(28,29).
successor(29,30).
successor(31,32).
successor(32,33).
successor(33,34).
successor(34,35).
successor(35,36).
successor(36,37).
successor(37,38).
successor(38,39).
successor(39,40).
successor(41,42).
successor(42,43).
successor(43,44).
successor(44,45).
successor(45,46).
successor(46,47).
successor(47,48).
successor(48,49).
successor(49,50).
successor(51,52).
successor(52,53).
successor(53,54).
successor(54,55).
successor(55,56).
successor(56,57).
successor(57,58).
successor(58,59).
successor(59,60).
successor(60,61).













