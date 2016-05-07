#const n=20.
state(6, 1, 10).
state(16, 1, 11).
state(2, 2, 6).
state(3, 2, 13).
state(8, 2, 4).
state(12, 2, 3).
state(17, 2, 7).
state(7, 3, 3).
state(14, 3, 17).
state(16, 3, 9).
state(19, 3, 2).
state(20, 3, 5).
state(1, 4, 1).
state(12, 4, 17).
state(20, 4, 10).
state(3, 5, 16).
state(5, 5, 2).
state(7, 5, 17).
state(7, 6, 15).
state(10, 6, 19).
state(12, 6, 6).
state(2, 7, 2).
state(4, 7, 7).
state(11, 7, 14).
state(5, 8, 3).
state(3, 9, 3).
state(13, 9, 10).
state(18, 9, 15).
state(13, 11, 5).
state(16, 11, 14).
state(2, 12, 11).
state(15, 12, 2).
state(16, 12, 15).
state(4, 13, 4).
state(13, 13, 18).
state(15, 13, 7).
state(20, 13, 13).
state(4, 14, 9).
state(5, 14, 19).
state(10, 14, 6).
state(6, 15, 7).
state(9, 15, 2).
state(10, 15, 11).
state(13, 15, 14).
state(1, 16, 9).
state(9, 16, 3).
state(10, 16, 15).
state(12, 16, 11).
state(16, 16, 2).
state(6, 17, 17).
state(18, 17, 7).
state(7, 18, 14).
state(11, 18, 12).
state(12, 18, 20).
state(15, 18, 10).
state(16, 19, 16).
state(11, 20, 9).
state(14, 20, 20).
state(18, 20, 4).
state(19, 20, 12).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).
{__constraint(v(X,Y), "$!=", S)}:-state(X,Y,S).