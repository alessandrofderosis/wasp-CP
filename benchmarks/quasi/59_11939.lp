#const n=20.
state(2, 1, 2).
state(3, 1, 6).
state(4, 1, 3).
state(6, 1, 4).
state(14, 1, 12).
state(16, 1, 20).
state(18, 1, 15).
state(19, 1, 16).
state(20, 1, 5).
state(1, 2, 8).
state(2, 2, 9).
state(3, 2, 15).
state(8, 2, 10).
state(9, 2, 14).
state(12, 2, 11).
state(14, 2, 19).
state(17, 2, 4).
state(19, 2, 18).
state(4, 3, 1).
state(5, 3, 20).
state(6, 3, 16).
state(7, 3, 2).
state(8, 3, 7).
state(12, 3, 18).
state(15, 3, 4).
state(17, 3, 6).
state(1, 4, 18).
state(2, 4, 11).
state(4, 4, 10).
state(5, 4, 6).
state(10, 4, 1).
state(13, 4, 14).
state(14, 4, 17).
state(15, 4, 12).
state(16, 4, 4).
state(17, 4, 20).
state(1, 5, 7).
state(4, 5, 8).
state(8, 5, 17).
state(9, 5, 15).
state(14, 5, 4).
state(15, 5, 5).
state(19, 5, 12).
state(20, 5, 13).
state(3, 6, 4).
state(11, 6, 14).
state(12, 6, 5).
state(14, 6, 7).
state(15, 6, 19).
state(17, 6, 12).
state(18, 6, 13).
state(19, 6, 3).
state(6, 7, 7).
state(7, 7, 3).
state(9, 7, 4).
state(12, 7, 1).
state(13, 7, 16).
state(14, 7, 18).
state(17, 7, 8).
state(19, 7, 15).
state(20, 7, 6).
state(1, 8, 6).
state(3, 8, 16).
state(6, 8, 9).
state(7, 8, 17).
state(11, 8, 15).
state(12, 8, 13).
state(13, 8, 2).
state(16, 8, 1).
state(17, 8, 7).
state(18, 8, 4).
state(20, 8, 19).
state(1, 9, 3).
state(3, 9, 17).
state(7, 9, 13).
state(9, 9, 7).
state(11, 9, 10).
state(12, 9, 4).
state(14, 9, 5).
state(15, 9, 9).
state(16, 9, 6).
state(17, 9, 2).
state(20, 9, 8).
state(4, 10, 18).
state(5, 10, 19).
state(7, 10, 1).
state(8, 10, 2).
state(10, 10, 10).
state(11, 10, 12).
state(12, 10, 16).
state(14, 10, 9).
state(15, 10, 3).
state(16, 10, 11).
state(3, 11, 13).
state(4, 11, 2).
state(5, 11, 5).
state(6, 11, 14).
state(8, 11, 18).
state(14, 11, 10).
state(17, 11, 16).
state(7, 12, 15).
state(8, 12, 13).
state(9, 12, 1).
state(10, 12, 8).
state(13, 12, 5).
state(14, 12, 2).
state(15, 12, 10).
state(20, 12, 20).
state(1, 13, 1).
state(4, 13, 9).
state(6, 13, 2).
state(8, 13, 12).
state(13, 13, 7).
state(17, 13, 15).
state(19, 13, 19).
state(20, 13, 16).
state(4, 14, 20).
state(7, 14, 16).
state(14, 14, 13).
state(15, 14, 6).
state(18, 14, 17).
state(19, 14, 10).
state(1, 15, 14).
state(2, 15, 3).
state(4, 15, 13).
state(5, 15, 8).
state(7, 15, 20).
state(8, 15, 5).
state(9, 15, 10).
state(10, 15, 17).
state(14, 15, 11).
state(15, 15, 16).
state(1, 16, 17).
state(2, 16, 20).
state(3, 16, 12).
state(7, 16, 10).
state(12, 16, 2).
state(13, 16, 11).
state(15, 16, 14).
state(18, 16, 18).
state(1, 17, 13).
state(2, 17, 5).
state(3, 17, 9).
state(5, 17, 12).
state(7, 17, 6).
state(8, 17, 3).
state(10, 17, 16).
state(12, 17, 17).
state(16, 17, 10).
state(19, 17, 7).
state(4, 18, 19).
state(6, 18, 11).
state(10, 18, 15).
state(11, 18, 7).
state(13, 18, 17).
state(14, 18, 16).
state(15, 18, 2).
state(18, 18, 9).
state(19, 18, 4).
state(20, 18, 12).
state(1, 19, 19).
state(2, 19, 6).
state(3, 19, 10).
state(5, 19, 14).
state(6, 19, 20).
state(8, 19, 9).
state(9, 19, 16).
state(10, 19, 3).
state(12, 19, 8).
state(15, 19, 11).
state(20, 19, 1).
state(1, 20, 9).
state(7, 20, 14).
state(11, 20, 2).
state(12, 20, 12).
state(13, 20, 13).
state(14, 20, 1).
state(17, 20, 17).
state(18, 20, 3).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.