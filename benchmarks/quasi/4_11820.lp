#const n=20.
state(11, 2, 10).
state(20, 3, 19).
state(8, 7, 15).
state(9, 8, 13).
state(1, 10, 3).
state(11, 10, 7).
state(19, 10, 19).
state(13, 11, 2).
state(14, 12, 1).
state(16, 13, 6).
state(13, 17, 10).
state(18, 18, 2).
state(1, 19, 17).
state(6, 19, 16).
state(13, 20, 12).
state(18, 20, 13).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.