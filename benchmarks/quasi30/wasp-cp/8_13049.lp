#const n=30.

state(12, 1, 16).
state(18, 1, 7).
state(29, 1, 25).
state(18, 2, 4).
state(19, 2, 6).
state(1, 3, 11).
state(18, 3, 25).
state(17, 4, 10).
state(28, 4, 15).
state(8, 5, 30).
state(9, 5, 12).
state(12, 5, 28).
state(11, 6, 16).
state(2, 7, 30).
state(24, 7, 12).
state(16, 8, 16).
state(22, 8, 28).
state(26, 8, 23).
state(23, 9, 6).
state(1, 10, 8).
state(23, 10, 22).
state(1, 11, 7).
state(9, 11, 26).
state(17, 11, 2).
state(3, 12, 22).
state(16, 12, 9).
state(4, 13, 26).
state(17, 13, 28).
state(20, 13, 6).
state(8, 14, 13).
state(30, 14, 15).
state(8, 15, 8).
state(26, 15, 20).
state(12, 16, 25).
state(27, 16, 28).
state(5, 17, 21).
state(17, 17, 15).
state(21, 17, 8).
state(10, 18, 30).
state(5, 19, 4).
state(1, 20, 23).
state(5, 20, 8).
state(11, 20, 5).
state(15, 20, 22).
state(22, 20, 27).
state(24, 20, 16).
state(12, 21, 29).
state(29, 21, 8).
state(17, 22, 1).
state(4, 23, 11).
state(22, 23, 17).
state(5, 24, 1).
state(15, 24, 11).
state(24, 24, 2).
state(27, 24, 5).
state(4, 25, 9).
state(6, 25, 15).
state(7, 26, 16).
state(1, 27, 21).
state(1, 28, 26).
state(13, 28, 1).
state(16, 28, 15).
state(20, 28, 30).
state(25, 28, 29).
state(4, 29, 23).
state(9, 29, 18).
state(12, 29, 26).
state(10, 30, 19).
state(17, 30, 16).
state(21, 30, 27).
state(22, 30, 7).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.