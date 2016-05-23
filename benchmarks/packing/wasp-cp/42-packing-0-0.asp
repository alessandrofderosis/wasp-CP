%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(300,250).
max_square_num(27).
square(1,47).
square(2,102).
square(3,130).
square(4,110).
square(5,39).
square(6,21).
square(7,10).
square(8,67).
square(9,59).
square(10,29).
square(11,7).
square(12,23).
square(13,51).
square(14,48).
square(15,36).
square(16,52).
square(17,33).
square(18,14).
square(19,22).
square(20,27).
square(21,18).
square(22,17).
square(23,11).
square(24,9).
square(25,22).
square(26,8).
square(27,22).
__constraint("$domain(0..10000)").
:- square(X,S), area(W,H),__constraint(posx(X), "$>", W-S).
:- square(X,S), area(W,H),__constraint(posy(X), "$>", H-S).
intersectx(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posx(X1), "$<=", posx(X2)), __constraint(posx(X1),"$+",S1,"$>",posx(X2)), X1 != X2.
intersectx(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posx(X1), "$<", posx(X2),"$+",S2), __constraint(posx(X1),"$+",S1,"$>",posx(X2),"$+",S2), X1 != X2.
intersecty(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posy(X1),"$<=", posy(X2)),__constraint(posy(X1),"$+",S1,"$>",posy(X2)),X1 != X2.
intersecty(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posy(X1),"$<",  posy(X2),"$+",S2), __constraint(posy(X1),"$+",S1,"$>",posy(X2),"$+",S2), X1 != X2.

#external __constraint/3.
#external __constraint/5.
#external __constraint/7.