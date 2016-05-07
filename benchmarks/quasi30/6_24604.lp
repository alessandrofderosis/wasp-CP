#const n=30.

state(8, 1, 28).
state(11, 2, 16).
state(20, 2, 24).
state(23, 2, 12).
state(8, 3, 30).
state(16, 3, 14).
state(25, 3, 20).
state(2, 4, 14).
state(5, 4, 7).
state(8, 5, 6).
state(13, 5, 4).
state(22, 8, 7).
state(18, 9, 16).
state(20, 9, 29).
state(3, 10, 18).
state(10, 10, 24).
state(25, 10, 27).
state(15, 12, 6).
state(1, 13, 3).
state(25, 13, 16).
state(26, 13, 23).
state(28, 13, 14).
state(29, 14, 13).
state(19, 15, 10).
state(28, 15, 11).
state(30, 15, 4).
state(10, 16, 13).
state(7, 17, 11).
state(9, 17, 21).
state(20, 17, 26).
state(25, 17, 12).
state(4, 18, 13).
state(12, 18, 24).
state(15, 18, 2).
state(25, 18, 19).
state(27, 19, 22).
state(17, 20, 16).
state(21, 20, 29).
state(16, 21, 16).
state(19, 21, 28).
state(9, 22, 12).
state(11, 22, 1).
state(24, 22, 24).
state(5, 23, 16).
state(7, 23, 1).
state(14, 24, 7).
state(14, 26, 27).
state(2, 27, 11).
state(17, 27, 2).
state(20, 27, 25).
state(26, 28, 4).
state(21, 29, 20).
state(26, 30, 19).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).