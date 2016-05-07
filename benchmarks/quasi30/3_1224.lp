#const n=30.

state(12, 1, 16).
state(3, 2, 4).
state(7, 3, 6).
state(8, 4, 23).
state(20, 4, 18).
state(24, 4, 5).
state(12, 5, 3).
state(10, 6, 2).
state(26, 6, 20).
state(22, 9, 23).
state(9, 10, 27).
state(22, 10, 17).
state(14, 12, 6).
state(1, 13, 2).
state(7, 15, 23).
state(3, 16, 2).
state(16, 16, 24).
state(27, 17, 29).
state(24, 18, 15).
state(21, 20, 19).
state(4, 22, 5).
state(11, 23, 10).
state(23, 23, 22).
state(24, 24, 11).
state(2, 25, 9).
state(17, 25, 28).
state(4, 27, 8).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).