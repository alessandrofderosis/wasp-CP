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
area(100,50).
max_square_num(21).
square(1,31).
square(2,34).
square(3,9).
square(4,25).
square(5,8).
square(6,9).
square(7,9).
square(8,4).
square(9,14).
square(10,10).
square(11,20).
square(12,6).
square(13,9).
square(14,7).
square(15,7).
square(16,11).
square(17,4).
square(18,5).
square(19,6).
square(20,5).
square(21,6).
