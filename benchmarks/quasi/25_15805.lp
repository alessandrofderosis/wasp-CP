#const n=20.
state(10, 1, 17).
state(14, 1, 4).
state(15, 1, 8).
state(16, 1, 18).
state(17, 1, 12).
state(1, 2, 10).
state(2, 2, 15).
state(7, 2, 18).
state(15, 2, 19).
state(20, 2, 11).
state(9, 3, 7).
state(18, 3, 10).
state(20, 3, 12).
state(2, 4, 2).
state(6, 4, 4).
state(14, 4, 18).
state(17, 4, 19).
state(19, 4, 5).
state(3, 5, 16).
state(4, 5, 2).
state(10, 5, 7).
state(11, 5, 4).
state(4, 6, 9).
state(7, 6, 17).
state(11, 6, 5).
state(18, 6, 14).
state(1, 7, 9).
state(5, 7, 1).
state(9, 7, 2).
state(11, 7, 15).
state(13, 7, 7).
state(14, 7, 8).
state(20, 7, 3).
state(2, 8, 1).
state(6, 8, 15).
state(10, 8, 8).
state(6, 9, 2).
state(1, 10, 6).
state(3, 10, 2).
state(12, 10, 11).
state(13, 10, 4).
state(15, 10, 7).
state(15, 11, 14).
state(16, 11, 7).
state(1, 12, 14).
state(4, 12, 11).
state(7, 12, 5).
state(10, 12, 6).
state(11, 12, 20).
state(1, 13, 11).
state(3, 13, 6).
state(8, 13, 16).
state(2, 14, 3).
state(5, 14, 16).
state(8, 14, 7).
state(12, 14, 10).
state(16, 14, 17).
state(19, 14, 6).
state(20, 14, 13).
state(5, 15, 17).
state(10, 15, 14).
state(2, 16, 4).
state(9, 16, 19).
state(18, 16, 7).
state(19, 16, 11).
state(20, 16, 18).
state(3, 17, 11).
state(8, 17, 18).
state(15, 17, 4).
state(16, 17, 14).
state(17, 17, 9).
state(3, 18, 13).
state(5, 18, 11).
state(9, 18, 20).
state(13, 18, 5).
state(15, 18, 17).
state(16, 18, 19).
state(19, 18, 18).
state(6, 19, 18).
state(8, 19, 19).
state(10, 19, 12).
state(16, 19, 15).
state(1, 20, 19).
state(2, 20, 12).
state(5, 20, 14).
state(14, 20, 3).
state(15, 20, 9).
state(18, 20, 5).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.