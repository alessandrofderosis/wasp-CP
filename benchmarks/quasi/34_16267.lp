#const n=20.
state(2, 1, 3).
state(5, 1, 20).
state(7, 1, 17).
state(10, 1, 12).
state(15, 1, 5).
state(16, 1, 14).
state(17, 1, 6).
state(19, 1, 2).
state(4, 2, 16).
state(5, 2, 9).
state(8, 2, 1).
state(11, 2, 18).
state(12, 2, 19).
state(17, 2, 7).
state(18, 2, 5).
state(1, 3, 11).
state(2, 3, 12).
state(3, 3, 14).
state(4, 3, 7).
state(7, 3, 9).
state(9, 3, 10).
state(13, 3, 17).
state(7, 4, 18).
state(9, 4, 13).
state(12, 4, 2).
state(20, 4, 19).
state(3, 5, 20).
state(12, 5, 17).
state(17, 5, 8).
state(19, 5, 1).
state(20, 5, 4).
state(3, 6, 19).
state(19, 6, 18).
state(2, 7, 15).
state(5, 7, 2).
state(6, 7, 1).
state(13, 7, 7).
state(19, 7, 5).
state(20, 7, 11).
state(1, 8, 5).
state(3, 8, 17).
state(4, 8, 12).
state(5, 8, 10).
state(6, 8, 2).
state(8, 8, 20).
state(10, 8, 4).
state(20, 8, 8).
state(3, 9, 5).
state(4, 9, 13).
state(6, 9, 8).
state(8, 9, 3).
state(9, 9, 9).
state(13, 9, 12).
state(14, 9, 16).
state(15, 9, 6).
state(1, 10, 14).
state(4, 10, 5).
state(5, 10, 3).
state(7, 10, 15).
state(12, 10, 20).
state(13, 10, 8).
state(16, 10, 11).
state(17, 10, 17).
state(19, 10, 12).
state(20, 10, 1).
state(1, 11, 16).
state(4, 11, 11).
state(10, 11, 9).
state(16, 11, 2).
state(19, 11, 10).
state(4, 12, 9).
state(9, 12, 6).
state(14, 12, 14).
state(15, 12, 18).
state(16, 12, 3).
state(1, 13, 20).
state(2, 13, 5).
state(6, 13, 16).
state(8, 13, 15).
state(11, 13, 17).
state(17, 13, 3).
state(18, 13, 6).
state(20, 13, 10).
state(1, 14, 8).
state(9, 14, 4).
state(18, 14, 9).
state(20, 14, 7).
state(7, 15, 20).
state(8, 15, 19).
state(10, 15, 3).
state(15, 15, 15).
state(2, 16, 11).
state(9, 16, 15).
state(12, 16, 6).
state(13, 16, 10).
state(17, 16, 1).
state(1, 17, 2).
state(7, 17, 11).
state(9, 17, 16).
state(11, 17, 4).
state(13, 17, 18).
state(14, 17, 5).
state(16, 17, 20).
state(1, 18, 19).
state(4, 18, 2).
state(11, 18, 15).
state(15, 18, 4).
state(19, 18, 3).
state(2, 19, 9).
state(7, 19, 3).
state(13, 19, 5).
state(14, 19, 6).
state(15, 19, 11).
state(20, 19, 17).
state(13, 20, 6).
state(15, 20, 1).
state(17, 20, 11).
state(18, 20, 13).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.