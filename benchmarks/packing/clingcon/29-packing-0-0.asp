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
max_square_num(18).
square(1,123).
square(2,27).
square(3,9).
square(4,33).
square(5,73).
square(6,22).
square(7,6).
square(8,28).
square(9,10).
square(10,21).
square(11,10).
square(12,28).
square(13,9).
square(14,22).
square(15,15).
square(16,8).
square(17,5).
square(18,13).
