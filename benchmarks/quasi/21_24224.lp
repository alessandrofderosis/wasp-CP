#const n=20.
state(2, 1, 20).
state(7, 1, 15).
state(16, 1, 11).
state(17, 1, 16).
state(6, 2, 4).
state(10, 2, 16).
state(15, 2, 20).
state(16, 2, 10).
state(9, 3, 12).
state(10, 3, 8).
state(13, 3, 10).
state(16, 3, 3).
state(1, 4, 3).
state(4, 4, 10).
state(8, 4, 5).
state(2, 5, 11).
state(17, 5, 7).
state(4, 6, 9).
state(10, 6, 20).
state(17, 6, 10).
state(18, 6, 12).
state(19, 6, 19).
state(20, 6, 15).
state(11, 7, 8).
state(14, 7, 4).
state(1, 8, 7).
state(6, 8, 1).
state(8, 8, 17).
state(15, 8, 13).
state(4, 9, 4).
state(8, 9, 16).
state(11, 9, 13).
state(19, 9, 9).
state(4, 10, 5).
state(8, 10, 19).
state(12, 10, 12).
state(10, 11, 1).
state(12, 11, 5).
state(15, 11, 12).
state(18, 11, 2).
state(5, 12, 12).
state(8, 12, 6).
state(2, 13, 16).
state(3, 13, 17).
state(4, 13, 19).
state(12, 13, 13).
state(17, 13, 11).
state(19, 13, 1).
state(3, 14, 3).
state(6, 14, 17).
state(3, 15, 13).
state(4, 15, 6).
state(5, 15, 3).
state(7, 15, 10).
state(16, 15, 15).
state(17, 15, 9).
state(5, 16, 18).
state(6, 16, 5).
state(9, 16, 4).
state(15, 16, 1).
state(17, 16, 6).
state(3, 17, 11).
state(8, 17, 9).
state(13, 17, 5).
state(18, 17, 16).
state(19, 17, 2).
state(6, 18, 18).
state(7, 18, 11).
state(17, 18, 14).
state(20, 18, 1).
state(4, 19, 3).
state(11, 19, 7).
state(13, 19, 6).
state(16, 19, 12).
state(17, 19, 2).
state(10, 20, 2).
state(19, 20, 10).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.