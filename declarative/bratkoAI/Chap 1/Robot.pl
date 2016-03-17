
% see(Block,X,Y) : Block is observed by camera at coordinates X & Y.
see(a,2,5).
see(d,5,5).
see(e,5,2).


% on(Block, Object) : Block is standing on Object.
on(a,b).
on(b,c).
on(c,table).
on(d,table).
on(e,table).

% applying z coordinates
z(B,0) :- on(B,table).
z(B,ZO+1) :-
	on(B,BO), z(BO,ZO).

zzz(B,0) :- on(B,table).
zzz(B,ZO+height(BO)) :-
	on(B,BO),
	zzz(BO,ZO).

xy(B,X,Y) :-
	see(B,X,Y).
xy(B,X,Y) :-
	on(BO,B),
	xy(BO,X,Y).
