% ============================================================
% Uniform Cost Search
% ============================================================


search(Start,Goal,Path) :- ucs([ [Start/0] ], Goal, Path).


ucs([],Goal,)



extend([[]| List])