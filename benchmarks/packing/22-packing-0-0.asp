%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(200,150).
max_square_num(11).
square(1,148).
square(2,34).
square(3,49).
square(4,45).
square(5,5).
square(6,11).
square(7,8).
square(8,9).
square(9,11).
square(10,4).
square(11,5).
___constraint("$domain(0..10000)").
:- square(X,S), area(W,H),__constraint(posx(X), "$>", W-S).
:- square(X,S), area(W,H),__constraint(posy(X), "$>", H-S).
intersectx(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posx(X1), "$<=", posx(X2)), __constraint(posx(X1),"$+",S1,"$>",posx(X2)), X1 != X2.
intersectx(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posx(X1), "$<", posx(X2),"$+",S2), __constraint(posx(X1),"$+",S1,"$>",posx(X2),"$+",S2), X1 != X2.
intersecty(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posy(X1),"$<=", posy(X2)),__constraint(posy(X1),"$+",S1,"$>",posy(X2)),X1 != X2.
intersecty(X1,X2) :- square(X1,S1), square(X2,S2),__constraint(posy(X1),"$<",  posy(X2),"$+",S2), __constraint(posy(X1),"$+",S1,"$>",posy(X2),"$+",S2), X1 != X2.

{__constraint(posx(X), "$>", W-S)}:- square(X,S), area(W,H).
{__constraint(posy(X), "$>", H-S)}:- square(X,S), area(W,H).

{__constraint(posx(X1), "$<=", posx(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posx(X1),"$+",S1,"$>",posx(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posx(X1), "$<", posx(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.
{__constraint(posx(X1),"$+",S1,"$>",posx(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.

{__constraint(posy(X1), "$<=", posy(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posy(X1),"$+",S1,"$>",posy(X2))}:-square(X1,S1), square(X2,S2),X1!=X2.
{__constraint(posy(X1), "$<", posy(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.
{__constraint(posy(X1),"$+",S1,"$>",posy(X2),"$+",S2)}:-square(X1,S1), square(X2,S2),square(X2,S2),X1!=X2.