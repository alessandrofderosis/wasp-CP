#const n=30.

state(1, 1, 22).
state(6, 1, 1).
state(7, 1, 23).
state(9, 1, 2).
state(13, 1, 16).
state(22, 1, 4).
state(23, 1, 3).
state(1, 2, 29).
state(7, 2, 10).
state(10, 2, 20).
state(11, 2, 25).
state(28, 2, 22).
state(10, 3, 3).
state(13, 3, 11).
state(14, 3, 7).
state(17, 3, 6).
state(18, 3, 24).
state(21, 3, 18).
state(25, 3, 25).
state(26, 3, 26).
state(28, 3, 20).
state(9, 4, 6).
state(12, 4, 13).
state(15, 4, 23).
state(24, 4, 22).
state(1, 5, 16).
state(7, 5, 19).
state(14, 5, 13).
state(19, 5, 22).
state(1, 6, 26).
state(2, 6, 4).
state(9, 6, 24).
state(16, 6, 27).
state(17, 6, 20).
state(23, 6, 12).
state(25, 6, 15).
state(27, 6, 21).
state(1, 7, 23).
state(6, 7, 17).
state(18, 7, 18).
state(20, 7, 1).
state(26, 7, 14).
state(1, 8, 27).
state(3, 8, 8).
state(15, 8, 21).
state(16, 8, 11).
state(18, 8, 5).
state(22, 8, 16).
state(26, 8, 2).
state(1, 9, 11).
state(9, 9, 10).
state(17, 9, 1).
state(19, 9, 21).
state(21, 9, 30).
state(25, 9, 9).
state(27, 9, 6).
state(28, 9, 15).
state(2, 10, 24).
state(6, 10, 4).
state(8, 10, 30).
state(12, 10, 20).
state(13, 10, 15).
state(14, 10, 14).
state(24, 10, 11).
state(25, 10, 28).
state(26, 10, 17).
state(28, 10, 27).
state(30, 10, 21).
state(3, 11, 14).
state(4, 11, 3).
state(9, 11, 11).
state(10, 11, 15).
state(11, 11, 23).
state(21, 11, 10).
state(2, 12, 17).
state(13, 12, 7).
state(15, 12, 9).
state(17, 12, 24).
state(20, 12, 5).
state(27, 12, 13).
state(1, 13, 2).
state(5, 13, 19).
state(14, 13, 1).
state(20, 13, 4).
state(22, 13, 6).
state(23, 13, 11).
state(2, 14, 13).
state(10, 15, 11).
state(16, 15, 24).
state(17, 15, 30).
state(18, 15, 27).
state(24, 15, 21).
state(28, 15, 8).
state(30, 15, 29).
state(2, 16, 9).
state(7, 16, 25).
state(8, 16, 2).
state(9, 16, 29).
state(13, 16, 28).
state(15, 16, 13).
state(17, 16, 16).
state(28, 16, 23).
state(3, 17, 2).
state(5, 17, 24).
state(8, 17, 3).
state(21, 17, 28).
state(11, 18, 2).
state(14, 18, 8).
state(15, 18, 17).
state(20, 18, 26).
state(25, 18, 10).
state(26, 18, 24).
state(10, 19, 6).
state(12, 19, 5).
state(13, 19, 17).
state(15, 19, 30).
state(23, 19, 16).
state(28, 19, 11).
state(2, 20, 2).
state(5, 20, 8).
state(9, 20, 23).
state(14, 20, 26).
state(16, 20, 16).
state(17, 20, 5).
state(25, 20, 20).
state(26, 20, 13).
state(5, 21, 17).
state(7, 21, 11).
state(11, 21, 1).
state(23, 21, 5).
state(24, 21, 2).
state(3, 22, 9).
state(7, 22, 13).
state(8, 22, 21).
state(11, 22, 4).
state(15, 22, 18).
state(19, 22, 23).
state(1, 23, 13).
state(2, 23, 6).
state(6, 23, 22).
state(18, 23, 9).
state(20, 23, 25).
state(22, 23, 20).
state(27, 23, 4).
state(29, 23, 17).
state(8, 24, 23).
state(12, 24, 26).
state(14, 24, 11).
state(17, 24, 19).
state(24, 24, 4).
state(11, 25, 20).
state(16, 25, 15).
state(19, 25, 29).
state(5, 26, 13).
state(18, 26, 6).
state(24, 26, 24).
state(26, 26, 19).
state(27, 26, 18).
state(30, 26, 25).
state(2, 27, 29).
state(5, 27, 30).
state(6, 27, 19).
state(8, 27, 14).
state(29, 27, 8).
state(8, 28, 22).
state(11, 28, 10).
state(17, 28, 29).
state(19, 28, 16).
state(30, 28, 1).
state(5, 29, 21).
state(12, 29, 28).
state(1, 30, 7).
state(26, 30, 23).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.