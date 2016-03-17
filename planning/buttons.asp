
% Data
time(0..2).

% Generator
1 { press_a(T); press_b(T) } 1 :- time(T).


p(T+1) :- press_a(T), not p(T), time(T).
p(T+1) :- press_b(T), q(T), time(T).


q(T+1) :- press_b(T), p(T), time(T).
q(T+1) :- press_a(T), not press_b(T), q(T), time(T).

:- not p(3).
:- not q(3).