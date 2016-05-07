#const n=30.

state(4, 1, 7).
state(7, 1, 5).
state(28, 1, 15).
state(30, 1, 3).
state(17, 2, 12).
state(22, 2, 6).
state(28, 2, 27).
state(29, 2, 26).
state(18, 3, 10).
state(19, 3, 14).
state(20, 3, 16).
state(28, 4, 22).
state(6, 6, 1).
state(30, 6, 22).
state(27, 7, 9).
state(6, 8, 10).
state(10, 8, 3).
state(19, 9, 13).
state(2, 10, 18).
state(9, 11, 13).
state(21, 11, 4).
state(1, 12, 14).
state(11, 12, 5).
state(18, 12, 7).
state(19, 12, 3).
state(22, 12, 25).
state(29, 13, 18).
state(16, 14, 16).
state(17, 14, 20).
state(23, 14, 26).
state(5, 15, 16).
state(18, 16, 1).
state(1, 17, 10).
state(2, 17, 20).
state(14, 17, 2).
state(15, 17, 7).
state(18, 17, 15).
state(3, 18, 9).
state(8, 18, 28).
state(17, 18, 4).
state(24, 19, 19).
state(12, 20, 14).
state(30, 20, 21).
state(13, 21, 8).
state(1, 22, 1).
state(7, 22, 10).
state(14, 22, 29).
state(24, 22, 26).
state(4, 23, 30).
state(26, 23, 3).
state(2, 24, 10).
state(4, 24, 20).
state(22, 25, 10).
state(28, 25, 5).
state(3, 26, 22).
state(5, 26, 13).
state(23, 27, 19).
state(22, 28, 14).
state(1, 29, 6).
state(21, 30, 15).
state(26, 30, 7).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).