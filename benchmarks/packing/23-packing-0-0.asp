%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(200,150).
max_square_num(24).
square(1,5).
square(2,87).
square(3,92).
square(4,51).
square(5,42).
square(6,7).
square(7,26).
square(8,6).
square(9,12).
square(10,30).
square(11,19).
square(12,29).
square(13,24).
square(14,6).
square(15,9).
square(16,15).
square(17,21).
square(18,8).
square(19,16).
square(20,17).
square(21,5).
square(22,11).
square(23,8).
square(24,7).
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