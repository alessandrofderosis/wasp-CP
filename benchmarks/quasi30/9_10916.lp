#const n=30.

state(8, 1, 25).
state(10, 1, 11).
state(9, 2, 24).
state(29, 2, 1).
state(2, 3, 21).
state(3, 3, 28).
state(4, 3, 20).
state(20, 3, 13).
state(23, 3, 9).
state(6, 4, 21).
state(17, 4, 12).
state(22, 4, 29).
state(13, 5, 3).
state(28, 5, 15).
state(24, 6, 19).
state(1, 7, 24).
state(4, 7, 18).
state(30, 7, 1).
state(3, 8, 1).
state(26, 8, 19).
state(27, 8, 12).
state(8, 9, 15).
state(19, 9, 27).
state(3, 10, 27).
state(4, 10, 8).
state(23, 10, 2).
state(9, 11, 29).
state(29, 11, 26).
state(1, 12, 18).
state(15, 12, 27).
state(11, 13, 18).
state(20, 13, 11).
state(30, 14, 19).
state(12, 15, 12).
state(20, 15, 10).
state(23, 15, 16).
state(25, 15, 21).
state(2, 16, 8).
state(16, 16, 17).
state(29, 16, 28).
state(3, 17, 19).
state(9, 18, 15).
state(16, 18, 9).
state(19, 18, 22).
state(1, 19, 27).
state(4, 19, 1).
state(9, 19, 11).
state(21, 19, 12).
state(30, 19, 4).
state(4, 20, 13).
state(8, 20, 19).
state(21, 20, 26).
state(23, 20, 12).
state(11, 21, 16).
state(27, 21, 25).
state(9, 22, 30).
state(7, 23, 16).
state(14, 24, 20).
state(20, 24, 1).
state(28, 24, 24).
state(3, 25, 9).
state(18, 25, 18).
state(25, 25, 8).
state(28, 25, 6).
state(7, 26, 14).
state(29, 26, 10).
state(5, 27, 1).
state(16, 27, 27).
state(15, 28, 16).
state(28, 28, 27).
state(6, 29, 4).
state(8, 29, 18).
state(26, 29, 16).
state(27, 29, 2).
state(5, 30, 12).
state(10, 30, 13).
state(21, 30, 8).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.