#const n=20.
state(9, 1, 5).
state(10, 1, 19).
state(2, 2, 20).
state(20, 3, 9).
state(2, 4, 15).
state(3, 4, 16).
state(5, 4, 19).
state(10, 4, 3).
state(11, 4, 18).
state(11, 5, 20).
state(7, 6, 9).
state(9, 6, 18).
state(12, 6, 2).
state(19, 6, 8).
state(15, 7, 16).
state(9, 8, 9).
state(10, 8, 8).
state(17, 8, 12).
state(17, 9, 8).
state(20, 9, 3).
state(6, 10, 10).
state(9, 10, 20).
state(2, 11, 14).
state(3, 11, 1).
state(1, 12, 5).
state(12, 12, 20).
state(2, 13, 7).
state(5, 13, 1).
state(11, 13, 11).
state(9, 14, 10).
state(13, 14, 20).
state(4, 15, 13).
state(5, 15, 4).
state(5, 16, 2).
state(10, 16, 4).
state(2, 17, 1).
state(4, 17, 8).
state(8, 17, 4).
state(13, 17, 10).
state(11, 18, 7).
state(5, 19, 13).
state(10, 19, 7).
state(18, 19, 3).
state(13, 20, 3).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.