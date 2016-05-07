#const n=30.

state(10, 4, 11).
state(27, 5, 28).
state(16, 8, 17).
state(22, 8, 30).
state(26, 8, 24).
state(9, 11, 24).
state(23, 11, 27).
state(12, 14, 26).
state(28, 16, 5).
state(21, 18, 15).
state(19, 20, 29).
state(23, 21, 18).
state(26, 22, 12).
state(10, 25, 18).
state(27, 25, 7).
state(22, 28, 19).
state(4, 29, 17).
state(21, 29, 9).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).