#const n=20.
state(4, 1, 8).
state(5, 1, 14).
state(6, 1, 5).
state(10, 1, 18).
state(13, 1, 7).
state(16, 1, 17).
state(3, 2, 3).
state(6, 2, 13).
state(7, 2, 5).
state(15, 2, 10).
state(20, 2, 11).
state(14, 3, 7).
state(15, 3, 20).
state(16, 3, 19).
state(18, 3, 11).
state(10, 4, 9).
state(13, 4, 17).
state(15, 4, 18).
state(18, 4, 8).
state(6, 5, 8).
state(7, 5, 17).
state(8, 5, 9).
state(10, 5, 19).
state(13, 5, 16).
state(17, 5, 20).
state(2, 6, 12).
state(3, 6, 13).
state(7, 6, 19).
state(8, 6, 10).
state(14, 6, 1).
state(15, 6, 16).
state(1, 7, 14).
state(3, 7, 15).
state(4, 7, 2).
state(13, 7, 4).
state(14, 7, 19).
state(16, 7, 3).
state(20, 7, 10).
state(7, 8, 12).
state(11, 8, 16).
state(17, 8, 3).
state(18, 8, 13).
state(19, 8, 14).
state(4, 9, 15).
state(7, 9, 6).
state(3, 10, 14).
state(5, 10, 3).
state(12, 10, 10).
state(8, 11, 4).
state(10, 11, 1).
state(19, 11, 7).
state(4, 12, 18).
state(9, 12, 6).
state(10, 12, 4).
state(14, 12, 10).
state(18, 12, 5).
state(2, 13, 4).
state(6, 13, 7).
state(14, 13, 16).
state(20, 13, 13).
state(2, 14, 7).
state(3, 14, 9).
state(6, 14, 12).
state(8, 14, 17).
state(10, 14, 11).
state(16, 14, 13).
state(1, 15, 1).
state(5, 15, 20).
state(7, 15, 11).
state(9, 15, 17).
state(10, 15, 13).
state(11, 15, 14).
state(14, 15, 5).
state(18, 15, 10).
state(20, 15, 15).
state(3, 16, 4).
state(9, 16, 19).
state(15, 17, 7).
state(16, 17, 8).
state(17, 17, 12).
state(19, 17, 4).
state(20, 17, 5).
state(1, 18, 17).
state(6, 18, 18).
state(13, 18, 10).
state(4, 19, 6).
state(5, 19, 2).
state(6, 19, 14).
state(8, 19, 1).
state(10, 19, 7).
state(13, 19, 13).
state(2, 20, 14).
state(3, 20, 8).
state(5, 20, 1).
state(6, 20, 11).
state(8, 20, 7).
state(16, 20, 2).
state(18, 20, 6).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.