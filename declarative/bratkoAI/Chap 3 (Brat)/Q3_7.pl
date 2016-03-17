
means(0,zero).
means(1,one).
means(2,two).
means(3,three).
means(4,four).
means(5,four).
means(6,six).
means(7,seven).
means(8,eight).
means(9,nine).

translate([],[]).
translate([Head|Tail],[Head2|Temp]) :-
translate(Tail,Temp),means(Head,Head2).
