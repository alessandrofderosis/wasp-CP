#const n=30.

state(16, 1, 14).
state(22, 1, 7).
state(17, 2, 12).
state(9, 4, 30).
state(21, 5, 12).
state(23, 6, 2).
state(9, 9, 13).
state(25, 9, 10).
state(2, 10, 13).
state(12, 10, 7).
state(29, 10, 27).
state(4, 11, 1).
state(19, 11, 22).
state(12, 12, 20).
state(4, 13, 12).
state(11, 13, 27).
state(23, 13, 19).
state(5, 14, 30).
state(12, 14, 1).
state(30, 14, 9).
state(7, 15, 29).
state(5, 16, 27).
state(16, 17, 19).
state(18, 17, 15).
state(12, 18, 23).
state(18, 18, 14).
state(25, 18, 24).
state(29, 18, 12).
state(2, 19, 22).
state(11, 19, 17).
state(23, 19, 12).
state(11, 20, 19).
state(15, 20, 10).
state(27, 20, 7).
state(6, 22, 20).
state(2, 23, 19).
state(13, 24, 7).
state(10, 26, 22).
state(19, 26, 14).
state(24, 26, 16).
state(5, 27, 19).
state(7, 27, 5).
state(15, 27, 18).
state(19, 27, 12).
state(21, 28, 6).
state(4, 29, 26).
state(6, 29, 25).
state(23, 29, 27).
state(26, 29, 4).
state(3, 30, 13).
state(19, 30, 7).
state(23, 30, 17).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).