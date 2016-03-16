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

from X to Y :- node X, node Y, \+ X connects Y, assert(X to Y).
mark X :- assert(X).

X connects Y :- X to Y.

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
:- from arad to zerind.
:- from arad to sibiu.
:- from arad to timisoara.

% zerind
:- from zerind to arad.
:- from zerind to oradea.

% oradea
:- from oradea to sibiu.
:- from oradea to zerind.

% sibiu
:- from sibiu to oradea.
:- from sibiu to arad.
:- from sibiu to rimnicu.
:- from sibiu to fagaras.

% timisoara
:- from timisoara to arad.
:- from timisoara to lugoj.

% lugoj
:- from lugoj to timisoara.
:- from lugoj to mehadia.

% mehadia
:- from mehadia to lugoj.
:- from mehadia to drobeta.

% drobeta
:- from drobeta to mehadia.
:- from drobeta to craiova.

% craiova
:- from craiova to drobeta.
:- from craiova to rimnicu.
:- from craiova to pitesti.

% rimnicu
:- from rimnicu to sibiu.
:- from rimnicu to pitesti.
:- from rimnicu to craiova.

% pitesti
:- from pitesti to rimnicu.
:- from pitesti to bucharest.
:- from pitesti to craiova.

% fagaras
:- from fagaras to sibiu.
:- from fagaras to bucharest.

% bucharest
:- from bucharest to pitesti.
:- from bucharest to fagaras.
:- from bucharest to urziceni.
:- from bucharest to giurgiu.

% giurgiu
:- from giurgiu to bucharest.

% urziceni
:- from urziceni to bucharest.
:- from urziceni to hirsova.
:- from urziceni to vaslui.

% hirsova
:- from hirsova to urziceni.
:- from hirsova to eforie.

% eforie
:- from eforie to hirsova.

% vaslui
:- from vaslui to urziceni.
:- from vaslui to iasi.

% iasi
:- from iasi to vaslui.
:- from iasi to neamt.

% neamt
:- from neamt to iasi.