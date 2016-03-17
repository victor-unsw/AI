% ============================================================
% Database commands.
% ============================================================

:- op(100,fx,node).
:- op(200,xfx,to).
:- dynamic to/2.
:- op(400,fx,from).
:- dynamic from/2.
:- op(300,xfx,connects).
:- op(400,fx,mark).
:- op(300,xfx,cost).
:- dynamic cost/2.
:- op(200,xfx,--).
:- op(300,xfx,-->).
:- op(300,xfx,heu).
:- dynamic heu/2.
:- op(300,xfx,--->).
:- op(200,xfx,approach).
:- dynamic approach/2.

from X to Y cost Z :- node X, node Y, \+ X connects Y, assert(X to Y),assert(X to Y cost Z).
mark X :- assert(X).

from X to Y heu Z :- node X, node Y, assert(X approach Y heu Z).

X connects Y :- X to Y.
X -- Y --> Z :- X to Y cost Z.
X -- Y ---> H :- X approach Y heu H.

% ============================================================
% Data
% ============================================================

:- mark node arad.
:- mark node zerind.
:- mark node oradea.
:- mark node sibiu.
:- mark node timisoara.
:- mark node lugoj.
:- mark node mehadia.
:- mark node drobeta.
:- mark node craiova.
:- mark node rimnicu.
:- mark node fagaras.
:- mark node pitesti.
:- mark node bucharest.
:- mark node giurgiu.
:- mark node urziceni.
:- mark node hirsova.
:- mark node eforie.
:- mark node vaslui.
:- mark node iasi.
:- mark node neamt.

% Arad
:- from arad to zerind cost 75.
:- from arad to sibiu cost 140.
:- from arad to timisoara cost 118.

% zerind
:- from zerind to arad cost 75.
:- from zerind to oradea cost 71.

% oradea
:- from oradea to sibiu cost 151.
:- from oradea to zerind cost 71.

% sibiu
:- from sibiu to oradea cost 151.
:- from sibiu to arad cost 140.
:- from sibiu to rimnicu cost 80.
:- from sibiu to fagaras cost 99.

% timisoara
:- from timisoara to arad cost 118.
:- from timisoara to lugoj cost 111.

% lugoj
:- from lugoj to timisoara cost 111.
:- from lugoj to mehadia cost 70.

% mehadia
:- from mehadia to lugoj cost 70.
:- from mehadia to drobeta cost 75.

% drobeta
:- from drobeta to mehadia cost 75.
:- from drobeta to craiova cost 120.

% craiova
:- from craiova to drobeta cost 120.
:- from craiova to rimnicu cost 146.
:- from craiova to pitesti cost 138.

% rimnicu
:- from rimnicu to sibiu cost 80.
:- from rimnicu to pitesti cost 97.
:- from rimnicu to craiova cost 146.

% pitesti
:- from pitesti to rimnicu cost 97.
:- from pitesti to bucharest cost 101.
:- from pitesti to craiova cost 138.

% fagaras
:- from fagaras to sibiu cost 99.
:- from fagaras to bucharest cost 211.

% bucharest
:- from bucharest to pitesti cost 101.
:- from bucharest to fagaras cost 211.
:- from bucharest to urziceni cost 85.
:- from bucharest to giurgiu cost 90.

% giurgiu
:- from giurgiu to bucharest cost 90.

% urziceni
:- from urziceni to bucharest cost 85.
:- from urziceni to hirsova cost 98.
:- from urziceni to vaslui cost 142.

% hirsova
:- from hirsova to urziceni cost 98.
:- from hirsova to eforie cost 86.

% eforie
:- from eforie to hirsova cost 86.

% vaslui
:- from vaslui to urziceni cost 142.
:- from vaslui to iasi cost 92.

% iasi
:- from iasi to vaslui cost 92.
:- from iasi to neamt cost 87.

% neamt
:- from neamt to iasi cost 87.


% heurestics
:- from arad to bucharest heu 366.
:- from bucharest to bucharest heu 0.
:- from craiova to bucharest heu 160.
:- from drobeta to bucharest heu 242.
:- from eforie to bucharest heu 161.
:- from fagaras to bucharest heu 176.
:- from giurgiu to bucharest heu 77.
:- from hirsova to bucharest heu 151.
:- from iasi to bucharest heu 226.
:- from lugoj to bucharest heu 244.
:- from mehadia to bucharest heu 241.
:- from neamt to bucharest heu 234.
:- from oradea to bucharest heu 380.
:- from pitesti to bucharest heu 100.
:- from rimnicu to bucharest heu 193.
:- from sibiu to bucharest heu 253.
:- from timisoara to bucharest heu 329.
:- from urziceni to bucharest heu 80.
:- from vaslui to bucharest heu 199.
:- from zerind to bucharest heu 374.