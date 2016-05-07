#const n=20.
state(1, 1, 9).
state(9, 1, 20).
state(3, 2, 8).
state(7, 2, 11).
state(12, 2, 17).
state(19, 2, 9).
state(3, 3, 17).
state(7, 3, 5).
state(1, 4, 14).
state(14, 5, 18).
state(4, 6, 9).
state(5, 6, 14).
state(11, 6, 10).
state(20, 6, 15).
state(16, 7, 1).
state(1, 9, 6).
state(11, 9, 16).
state(13, 9, 14).
state(18, 9, 20).
state(19, 9, 4).
state(5, 10, 12).
state(9, 10, 1).
state(6, 12, 6).
state(16, 12, 4).
state(2, 13, 11).
state(6, 13, 20).
state(14, 13, 13).
state(19, 14, 11).
state(17, 15, 13).
state(19, 15, 3).
state(5, 16, 7).
state(6, 16, 12).
state(11, 16, 20).
state(9, 17, 9).
state(11, 17, 12).
state(5, 18, 18).
state(4, 20, 1).
state(7, 20, 9).
state(16, 20, 18).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).