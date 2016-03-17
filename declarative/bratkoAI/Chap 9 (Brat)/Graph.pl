%==================================================================
% Finding simple path.
%==================================================================

% graph([a,b,c,d],[e(a,b),e(b,c),e(c,d),e(b,d)]).
% path(A,Z,Graph,Path).

path(A,Z,Graph,Path) :- path1(A,[Z],Graph,Path).

path1(A,[A|Path1],_,[A|Path1]).

path1(A,[Z|Path1],Graph,Path) :-
adjacent(X,Z,Graph),
\+ member(X,Path1),
path1(A,[X,Z|Path1],Graph,Path).


adjacent(A,Y,graph(_,Edges)) :-
member(e(A,Y),Edges) ; member(e(Y,A),Edges).



%==================================================================
% Hamilton Path.
%==================================================================


% graph([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t] , [e(a,b), e(a,e),e(a,h),e(b,j),e(b,c), e(c,l), e(c,d), e(d,n), e(d,e), e(e,f), e(f,g), e(f,b), e(g,q), e(g,h), e(h,i), e(i,r), e(i,j), e(j,k), e(k,l), e(k,s), e(l,m), e(m,n), e(m,t), e(n,o), e(o,p), e(p,q), e(q,r), e(r,s), e(s,t), e(t,p) ] ).


hamiltonian(Graph,Path) :-
path(_,_,Graph,Path),
covers(Path,Graph).

covers(Path,Graph) :-
\+ (node(N,Graph), \+ member(N,Path)).

node(N,graph(Nodes,_)) :-
member(N,Nodes).




%==================================================================
% Path with Cost.
%==================================================================


% path(a,d,graph([a,b,c,d],[e(a,b,3), e(b,c,1), e(b,d,5), e(c,d,2), e(d,b,2)]),Path).

path(A,Z,Graph,Path,Cost) :-
path1(A,[Z],Graph,Path,Cost).

path1(A,[A|Path1],Graph,[A|Path1],0).

path1(A,[Z|Path1],Graph,Path,Cost) :-
adjacent(X,Z,Graph,SubCost),
\+ member(X,Path1),
path1(A,[X,Z|Path1],Graph,Path,PreCost), Cost is SubCost+PreCost.

adjacent(A,Y,graph(_,Edges),Cost) :-
member(e(A,Y,Cost),Edges).
