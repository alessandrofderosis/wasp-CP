%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(300,250).
max_square_num(31).
square(1,88).
square(2,106).
square(3,37).
square(4,47).
square(5,57).
square(6,145).
square(7,9).
square(8,28).
square(9,9).
square(10,10).
square(11,24).
square(12,23).
square(13,16).
square(14,47).
square(15,23).
square(16,24).
square(17,27).
square(18,22).
square(19,42).
square(20,13).
square(21,6).
square(22,8).
square(23,46).
square(24,25).
square(25,8).
square(26,14).
square(27,45).
square(28,45).
square(29,5).
square(30,42).
square(31,37).
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