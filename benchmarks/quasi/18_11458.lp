#const n=20.
state(2, 1, 11).
state(8, 1, 18).
state(11, 1, 16).
state(17, 1, 3).
state(10, 3, 4).
state(16, 3, 6).
state(20, 3, 8).
state(10, 4, 12).
state(15, 4, 4).
state(2, 5, 7).
state(4, 5, 18).
state(9, 5, 11).
state(13, 5, 20).
state(15, 5, 1).
state(20, 5, 10).
state(3, 6, 5).
state(6, 6, 1).
state(16, 6, 18).
state(18, 6, 2).
state(20, 6, 11).
state(8, 7, 11).
state(9, 7, 13).
state(20, 7, 9).
state(5, 8, 19).
state(18, 8, 15).
state(1, 10, 6).
state(3, 10, 8).
state(6, 11, 12).
state(12, 11, 13).
state(14, 11, 7).
state(18, 11, 18).
state(20, 11, 2).
state(8, 12, 12).
state(14, 12, 9).
state(16, 12, 10).
state(17, 12, 11).
state(1, 13, 14).
state(10, 13, 1).
state(5, 14, 15).
state(10, 14, 7).
state(15, 14, 19).
state(20, 14, 18).
state(1, 15, 12).
state(16, 15, 1).
state(17, 15, 13).
state(18, 15, 11).
state(5, 16, 8).
state(11, 16, 12).
state(17, 16, 16).
state(4, 17, 16).
state(8, 17, 7).
state(13, 17, 4).
state(1, 18, 20).
state(3, 18, 15).
state(9, 18, 6).
state(14, 18, 12).
state(3, 19, 13).
state(4, 19, 8).
state(13, 19, 7).
state(15, 19, 18).
state(7, 20, 2).
state(13, 20, 5).
state(16, 20, 4).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).