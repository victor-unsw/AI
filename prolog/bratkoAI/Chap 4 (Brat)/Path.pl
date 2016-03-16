
link(a,b).
link(a,c).
link(b,d).
link(c,d).
link(c,f).
link(d,f).
link(d,e).

path(Node,Node,[Node]).
path(StartNode,EndNode,[StartNode|Path]) :-
link(StartNode,TempNode),path(TempNode,EndNode,Path).

conc([],List,List).
conc([Head|Tail],List2,[Head|Temp]) :-
conc(Tail,List2,Temp).