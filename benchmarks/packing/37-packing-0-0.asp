%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(300,200).
max_square_num(22).
square(1,57).
square(2,134).
square(3,83).
square(4,19).
square(5,21).
square(6,15).
square(7,99).
square(8,9).
square(9,5).
square(10,49).
square(11,24).
square(12,39).
square(13,4).
square(14,4).
square(15,61).
square(16,50).
square(17,29).
square(18,22).
square(19,10).
square(20,17).
square(21,15).
square(22,13).
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