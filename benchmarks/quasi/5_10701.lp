#const n=20.
state(11, 1, 19).
state(12, 2, 3).
state(17, 2, 7).
state(15, 3, 2).
state(6, 4, 14).
state(16, 4, 20).
state(19, 6, 3).
state(2, 7, 18).
state(12, 7, 20).
state(12, 9, 2).
state(11, 12, 13).
state(12, 12, 11).
state(16, 12, 1).
state(18, 13, 15).
state(1, 14, 13).
state(9, 14, 20).
state(14, 14, 14).
state(11, 17, 1).
state(15, 17, 14).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).