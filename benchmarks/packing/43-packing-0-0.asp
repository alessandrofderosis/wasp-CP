%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(300,250).
max_square_num(24).
square(1,82).
square(2,188).
square(3,13).
square(4,44).
square(5,43).
square(6,19).
square(7,32).
square(8,51).
square(9,53).
square(10,5).
square(11,36).
square(12,46).
square(13,14).
square(14,58).
square(15,48).
square(16,37).
square(17,13).
square(18,5).
square(19,19).
square(20,24).
square(21,17).
square(22,17).
square(23,25).
square(24,22).
__constraint("$domain(0..10000)").
__constraint(posx(X), "$<=", W-S):- square(X,S), area(W,H).
__constraint(posy(X), "$<=", H-S) :- square(X,S), area(W,H).
intersectx(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posx(X1), "$<=", posx(X2)), __constraint(posx(X1),"$+",S1,"$>",posx(X2)), X1 != X2.
intersectx(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posx(X1), "$<", posx(X2),"$+",S2), __constraint(posx(X1),"$+",S1,"$>",posx(X2),"$+",S2), X1 != X2.
intersecty(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posy(X1),"$<=", posy(X2)),__constraint(posy(X1),"$+",S1,"$>",posy(X2)),X1 != X2.
intersecty(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posy(X1),"$<",  posy(X2),"$+",S2), __constraint(posy(X1),"$+",S1,"$>",posy(X2),"$+",S2), X1 != X2.

{__constraint(posx(X1), "$<=", posx(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posx(X1),"$+",S1,"$>",posx(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posx(X1), "$<", posx(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.
{__constraint(posx(X1),"$+",S1,"$>",posx(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.

{__constraint(posy(X1), "$<=", posy(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posy(X1),"$+",S1,"$>",posy(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posy(X1), "$<", posy(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.
{__constraint(posy(X1),"$+",S1,"$>",posy(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.