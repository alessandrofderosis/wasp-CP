%% Generator

#const mv=10000.
$domain(0..mv).

posx(X) $<= W-S :- square(X,S), area(W,H).
posy(X) $<= H-S :- square(X,S), area(W,H).

%very simple approach, checking edges

intersectx(X1,X2) :- square(X1,S1), square(X2,S2), posx(X1) $<= posx(X2),    posx(X1)$+S1$>posx(X2), X1 != X2.
intersectx(X1,X2) :- square(X1,S1), square(X2,S2), posx(X1) $<  posx(X2)$+S2, posx(X1)$+S1$>posx(X2)$+S2, X1 != X2.


intersecty(X1,X2) :- square(X1,S1), square(X2,S2), posy(X1) $<= posy(X2),     posy(X1)$+S1$>posy(X2),     X1 != X2.
intersecty(X1,X2) :- square(X1,S1), square(X2,S2), posy(X1) $<  posy(X2)$+S2, posy(X1)$+S1$>posy(X2)$+S2, X1 != X2.

intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
%:- square(X1,S1), square(X2,S2), X1 != X2, posx(X1) $<= posx(X2), posx(X1)+S1 $> posx(X2), posy(X1) $<= posy(X2), posy(X1)+S1 $> posy(X2).
area(200,150).
max_square_num(16).
square(1,147).
square(2,43).
square(3,23).
square(4,31).
square(5,22).
square(6,14).
square(7,15).
square(8,17).
square(9,23).
square(10,4).
square(11,19).
square(12,9).
square(13,7).
square(14,15).
square(15,6).
square(16,11).
