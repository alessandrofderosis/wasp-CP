#const n=30.

state(3, 1, 26).
state(8, 1, 20).
state(11, 1, 7).
state(22, 1, 3).
state(30, 1, 11).
state(1, 2, 23).
state(3, 2, 1).
state(4, 2, 11).
state(14, 2, 27).
state(24, 2, 3).
state(25, 2, 2).
state(5, 3, 25).
state(7, 3, 7).
state(15, 3, 13).
state(20, 3, 26).
state(24, 3, 2).
state(30, 3, 8).
state(13, 4, 5).
state(15, 4, 22).
state(16, 4, 9).
state(24, 4, 21).
state(30, 4, 16).
state(3, 5, 16).
state(5, 5, 24).
state(7, 5, 29).
state(10, 5, 4).
state(15, 5, 21).
state(19, 5, 1).
state(2, 6, 19).
state(6, 6, 30).
state(17, 6, 5).
state(19, 6, 7).
state(24, 6, 27).
state(27, 6, 8).
state(28, 6, 3).
state(6, 7, 18).
state(10, 7, 19).
state(11, 7, 10).
state(18, 7, 3).
state(20, 7, 14).
state(21, 7, 12).
state(22, 7, 25).
state(26, 7, 28).
state(28, 7, 9).
state(12, 8, 25).
state(13, 8, 11).
state(19, 8, 8).
state(22, 8, 18).
state(27, 8, 1).
state(1, 9, 28).
state(3, 9, 22).
state(10, 9, 17).
state(17, 9, 20).
state(21, 9, 16).
state(24, 9, 11).
state(26, 9, 13).
state(1, 10, 16).
state(6, 10, 23).
state(23, 10, 24).
state(26, 10, 22).
state(6, 11, 8).
state(8, 11, 12).
state(9, 11, 7).
state(23, 11, 2).
state(19, 12, 6).
state(27, 12, 30).
state(29, 12, 5).
state(1, 13, 9).
state(4, 13, 27).
state(19, 13, 28).
state(29, 13, 26).
state(1, 14, 11).
state(12, 14, 8).
state(18, 14, 14).
state(25, 14, 3).
state(28, 14, 17).
state(5, 15, 30).
state(13, 15, 25).
state(21, 15, 29).
state(25, 15, 16).
state(30, 15, 18).
state(2, 16, 3).
state(3, 16, 14).
state(8, 16, 23).
state(14, 16, 28).
state(29, 16, 9).
state(1, 17, 17).
state(8, 17, 2).
state(10, 17, 24).
state(16, 17, 8).
state(28, 17, 16).
state(2, 18, 5).
state(4, 18, 12).
state(11, 18, 13).
state(28, 18, 20).
state(29, 18, 3).
state(11, 19, 5).
state(16, 19, 25).
state(21, 19, 9).
state(25, 19, 7).
state(3, 20, 15).
state(21, 20, 27).
state(23, 20, 11).
state(29, 20, 29).
state(5, 21, 15).
state(11, 21, 2).
state(12, 21, 3).
state(14, 21, 25).
state(16, 21, 21).
state(21, 21, 4).
state(30, 21, 17).
state(5, 22, 13).
state(23, 22, 26).
state(24, 22, 10).
state(2, 23, 30).
state(3, 23, 23).
state(4, 23, 18).
state(12, 23, 12).
state(25, 23, 4).
state(28, 23, 11).
state(30, 23, 6).
state(2, 24, 21).
state(8, 24, 25).
state(10, 24, 1).
state(18, 24, 23).
state(3, 25, 12).
state(16, 25, 24).
state(22, 25, 2).
state(25, 25, 11).
state(28, 25, 13).
state(29, 25, 27).
state(8, 26, 29).
state(10, 26, 10).
state(17, 26, 30).
state(18, 26, 17).
state(24, 26, 15).
state(26, 26, 27).
state(9, 27, 24).
state(15, 27, 30).
state(26, 27, 1).
state(13, 28, 23).
state(18, 28, 1).
state(21, 28, 8).
state(9, 29, 6).
state(10, 29, 5).
state(22, 29, 9).
state(24, 29, 30).
state(1, 30, 13).
state(4, 30, 20).
state(8, 30, 4).
state(11, 30, 17).
state(12, 30, 6).
state(21, 30, 7).
state(26, 30, 14).
state(28, 30, 15).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.