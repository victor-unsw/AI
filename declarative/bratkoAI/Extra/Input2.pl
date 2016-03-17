
totdist([Tile|Tiles], [Position|Positions], D) :-
mandist(Tile, Position, D1),
totdist(Tiles, Positions, D2),
D is D1 + D2.