
% minimax(Pos, BestSucc, Val).
% Pos is a position, Val is its minimax Value;
% best move from Pos leads to Position BestSucc


moves(a,[b,c]).
moves(b,[d,e]).
moves(c,[f,g]).
moves(d,[h,i]).
moves(e,[j,k]).
moves(f,[l,m]).
moves(g,[h,o]).

staticval(h,1).
staticval(i,4).
staticval(j,5).
staticval(k,6).
staticval(l,2).
staticval(m,1).
staticval(n,1).
staticval(o,1).
staticval(oo,1000000).

% ========================

reverseSign(MAX,MIN).
reverseSign(MIN,MAX).

minimax(Pos,BestSucc,Val) :-
    max([Pos],BestSucc,Val).

max([],_,-1).

max([H|T],BestSucc,Val) :-
    moves(H,[H|List]), !,
    min(SuccList,Succ1,Val1),
    max(T,Succ2,Val2),
    betterOf(max,Succ1,Val1,Succ2,Val2,BestSucc)
    ;
    staticval(H,Val), BestSucc = H.

min([],_,10000).

min([H|T],BestSucc,Val) :-
    moves(H,SuccList), !,
    max(SuccList,Succ1,Val1),
    min(T,Succ2,Val2),
    betterOf(min,Succ1,Val1,Succ2,Val2,BestSucc)
    ;
    staticval(H,Val), BestSucc = H.

betterOf(min,Succ1,Val1,Succ2,Val2,BestSucc) :-
    (Val1 > Val2) -> (BestSucc = Succ2) ; (BestSucc = Succ1).

betterOf(max,Succ1,Val1,Succ2,Val2,BestSucc) :-
    (Val1 > Val2) -> (BestSucc = Succ1) ; (BestSucc = Succ2).

