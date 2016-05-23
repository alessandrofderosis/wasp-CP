#const n=20.
state(4, 2, 13).
state(10, 3, 1).
state(11, 4, 20).
state(14, 4, 1).
state(20, 4, 6).
state(17, 5, 11).
state(14, 6, 7).
state(20, 6, 8).
state(11, 7, 8).
state(13, 7, 3).
state(3, 8, 9).
state(5, 8, 2).
state(4, 11, 15).
state(12, 12, 17).
state(7, 13, 10).
state(5, 14, 14).
state(4, 15, 8).
state(15, 15, 3).
state(5, 16, 16).
state(6, 17, 10).
state(8, 18, 7).
state(9, 18, 9).
state(14, 18, 5).
state(5, 20, 6).
__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3.