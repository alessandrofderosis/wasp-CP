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
area(200,100).
max_square_num(21).
square(1,58).
square(2,95).
square(3,18).
square(4,26).
square(5,32).
square(6,5).
square(7,16).
square(8,14).
square(9,34).
square(10,16).
square(11,12).
square(12,6).
square(13,13).
square(14,8).
square(15,5).
square(16,5).
square(17,8).
square(18,10).
square(19,6).
square(20,8).
square(21,14).