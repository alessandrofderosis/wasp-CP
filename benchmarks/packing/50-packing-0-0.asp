%% Generator

#const mv=10000.


%very simple approach, checking edges




intersectx(X1,X2) :- intersectx(X2,X1), square(X1,S1), square(X2,S2).
intersecty(X1,X2) :- intersecty(X2,X1), square(X1,S1), square(X2,S2).
:- intersectx(X1,X2), intersecty(X1,X2).
area(300,250).
max_square_num(32).
square(1,29).
square(2,161).
square(3,112).
square(4,53).
square(5,37).
square(6,63).
square(7,28).
square(8,48).
square(9,22).
square(10,38).
square(11,20).
square(12,19).
square(13,51).
square(14,29).
square(15,11).
square(16,30).
square(17,16).
square(18,9).
square(19,5).
square(20,6).
square(21,31).
square(22,9).
square(23,17).
square(24,4).
square(25,34).
square(26,27).
square(27,21).
square(28,23).
square(29,33).
square(30,11).
square(31,25).
square(32,10).
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