#const n=30.

state(11, 1, 11).
state(16, 1, 2).
state(18, 1, 18).
state(21, 1, 27).
state(28, 1, 15).
state(1, 2, 28).
state(3, 2, 4).
state(8, 2, 27).
state(11, 2, 23).
state(12, 2, 30).
state(13, 2, 3).
state(14, 2, 10).
state(27, 2, 17).
state(10, 3, 28).
state(14, 3, 9).
state(20, 3, 21).
state(23, 3, 2).
state(1, 4, 24).
state(8, 4, 3).
state(20, 4, 27).
state(26, 4, 10).
state(30, 4, 16).
state(3, 5, 14).
state(10, 5, 23).
state(20, 5, 18).
state(29, 5, 11).
state(18, 6, 24).
state(21, 6, 15).
state(22, 6, 4).
state(24, 6, 21).
state(5, 7, 17).
state(7, 7, 24).
state(14, 7, 15).
state(27, 7, 11).
state(28, 7, 3).
state(23, 8, 28).
state(30, 8, 9).
state(11, 9, 7).
state(29, 9, 26).
state(14, 10, 13).
state(21, 10, 21).
state(23, 10, 8).
state(28, 10, 20).
state(4, 11, 11).
state(10, 11, 24).
state(12, 11, 17).
state(21, 11, 25).
state(23, 11, 3).
state(8, 12, 15).
state(15, 12, 5).
state(19, 12, 9).
state(25, 12, 25).
state(26, 12, 8).
state(27, 12, 2).
state(8, 13, 6).
state(11, 13, 22).
state(20, 13, 28).
state(2, 14, 7).
state(5, 14, 27).
state(6, 14, 15).
state(13, 14, 26).
state(19, 14, 23).
state(21, 14, 19).
state(1, 15, 27).
state(17, 15, 18).
state(22, 15, 9).
state(23, 15, 25).
state(24, 15, 28).
state(2, 16, 11).
state(16, 16, 29).
state(20, 16, 4).
state(21, 16, 30).
state(10, 17, 26).
state(15, 17, 21).
state(22, 17, 14).
state(18, 18, 16).
state(20, 18, 24).
state(22, 18, 7).
state(26, 18, 26).
state(26, 19, 1).
state(28, 19, 29).
state(30, 19, 14).
state(4, 20, 21).
state(5, 20, 2).
state(9, 20, 8).
state(21, 20, 9).
state(11, 21, 16).
state(16, 21, 5).
state(23, 21, 12).
state(26, 21, 29).
state(28, 21, 24).
state(11, 22, 13).
state(23, 22, 26).
state(3, 23, 2).
state(6, 23, 21).
state(13, 23, 25).
state(17, 23, 13).
state(27, 23, 5).
state(28, 23, 12).
state(1, 24, 9).
state(9, 24, 19).
state(14, 24, 6).
state(17, 24, 10).
state(2, 25, 1).
state(12, 25, 6).
state(17, 25, 19).
state(23, 25, 13).
state(5, 26, 12).
state(6, 27, 27).
state(4, 28, 29).
state(19, 28, 10).
state(4, 29, 8).
state(7, 29, 19).
state(9, 29, 26).
state(10, 29, 16).
state(17, 29, 28).
state(24, 29, 17).
state(25, 29, 1).
state(29, 29, 22).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.