%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(300,250).
max_square_num(24).
square(1,178).
square(2,79).
square(3,29).
square(4,27).
square(5,91).
square(6,45).
square(7,72).
square(8,46).
square(9,40).
square(10,25).
square(11,37).
square(12,19).
square(13,34).
square(14,35).
square(15,33).
square(16,20).
square(17,28).
square(18,10).
square(19,15).
square(20,8).
square(21,19).
square(22,15).
square(23,8).
square(24,26).
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