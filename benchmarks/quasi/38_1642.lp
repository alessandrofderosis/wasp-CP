#const n=20.
state(2, 1, 2).
state(8, 1, 18).
state(10, 1, 9).
state(11, 1, 12).
state(14, 1, 7).
state(16, 1, 1).
state(18, 1, 8).
state(1, 2, 17).
state(7, 2, 5).
state(10, 2, 14).
state(11, 2, 20).
state(12, 2, 15).
state(13, 2, 1).
state(14, 2, 2).
state(17, 2, 19).
state(19, 2, 3).
state(6, 3, 8).
state(7, 3, 9).
state(9, 3, 3).
state(10, 3, 10).
state(1, 4, 4).
state(7, 4, 2).
state(9, 4, 7).
state(15, 4, 6).
state(17, 4, 12).
state(20, 4, 10).
state(2, 5, 11).
state(3, 5, 1).
state(5, 5, 6).
state(6, 5, 2).
state(10, 5, 8).
state(12, 5, 14).
state(13, 5, 5).
state(17, 5, 20).
state(20, 5, 12).
state(5, 6, 10).
state(6, 6, 3).
state(15, 6, 7).
state(16, 6, 16).
state(18, 6, 17).
state(20, 6, 13).
state(2, 7, 15).
state(3, 7, 20).
state(8, 7, 9).
state(10, 7, 17).
state(13, 7, 18).
state(2, 8, 19).
state(3, 8, 12).
state(6, 8, 10).
state(7, 8, 14).
state(9, 8, 2).
state(10, 8, 4).
state(11, 8, 8).
state(12, 8, 5).
state(15, 8, 9).
state(7, 9, 19).
state(8, 9, 20).
state(12, 9, 18).
state(18, 9, 16).
state(19, 9, 5).
state(1, 10, 15).
state(2, 10, 17).
state(5, 10, 18).
state(8, 10, 1).
state(11, 10, 6).
state(16, 10, 14).
state(1, 11, 1).
state(4, 11, 11).
state(5, 11, 20).
state(9, 11, 12).
state(10, 11, 18).
state(11, 11, 17).
state(12, 11, 2).
state(18, 11, 14).
state(1, 12, 14).
state(3, 12, 16).
state(8, 12, 12).
state(13, 12, 10).
state(14, 12, 17).
state(15, 12, 5).
state(16, 12, 7).
state(18, 12, 1).
state(1, 13, 3).
state(2, 13, 7).
state(4, 13, 8).
state(5, 13, 17).
state(8, 13, 14).
state(10, 13, 12).
state(11, 13, 18).
state(14, 13, 6).
state(16, 13, 2).
state(4, 14, 1).
state(9, 14, 9).
state(11, 14, 16).
state(12, 14, 11).
state(15, 14, 20).
state(3, 15, 18).
state(4, 15, 6).
state(11, 15, 19).
state(6, 16, 19).
state(7, 16, 15).
state(8, 16, 10).
state(9, 16, 11).
state(10, 16, 5).
state(11, 16, 7).
state(17, 16, 16).
state(2, 17, 8).
state(3, 17, 14).
state(12, 17, 12).
state(14, 17, 3).
state(15, 17, 13).
state(18, 17, 4).
state(6, 18, 9).
state(9, 18, 5).
state(15, 18, 3).
state(16, 18, 11).
state(19, 18, 10).
state(7, 19, 13).
state(10, 19, 7).
state(11, 19, 15).
state(18, 19, 18).
state(19, 19, 8).
state(4, 20, 20).
state(5, 20, 19).
state(10, 20, 3).
state(12, 20, 9).
state(20, 20, 17).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.