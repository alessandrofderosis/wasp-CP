#const n=20.
state(13, 1, 6).
state(18, 1, 17).
state(1, 2, 11).
state(4, 3, 15).
state(7, 3, 12).
state(19, 3, 11).
state(13, 4, 20).
state(8, 5, 16).
state(9, 5, 19).
state(3, 6, 14).
state(4, 6, 1).
state(8, 6, 3).
state(12, 6, 10).
state(20, 6, 7).
state(6, 7, 8).
state(1, 8, 10).
state(6, 8, 1).
state(20, 8, 9).
state(4, 9, 14).
state(15, 9, 7).
state(17, 9, 3).
state(18, 9, 10).
state(4, 10, 7).
state(13, 10, 17).
state(16, 10, 9).
state(18, 10, 3).
state(6, 11, 20).
state(15, 11, 3).
state(7, 12, 18).
state(9, 12, 9).
state(13, 12, 1).
state(20, 12, 20).
state(7, 13, 9).
state(17, 13, 5).
state(1, 14, 3).
state(5, 14, 2).
state(8, 14, 18).
state(12, 14, 13).
state(13, 14, 15).
state(7, 15, 14).
state(11, 15, 15).
state(18, 16, 9).
state(20, 16, 2).
state(1, 17, 18).
state(5, 17, 15).
state(7, 17, 8).
state(11, 17, 5).
state(14, 17, 7).
state(8, 18, 2).
state(12, 18, 9).
state(20, 18, 17).
state(14, 19, 20).
state(6, 20, 9).
state(10, 20, 12).
state(19, 20, 10).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
__constraint(v(X,Y), "$==", S) :- state(X,Y,S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).