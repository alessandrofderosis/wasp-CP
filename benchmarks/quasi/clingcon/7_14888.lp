#const n=20.
state(6, 1, 17).
state(8, 1, 7).
state(4, 2, 1).
state(20, 2, 18).
state(8, 3, 15).
state(14, 3, 8).
state(4, 4, 7).
state(8, 4, 2).
state(12, 4, 11).
state(6, 5, 11).
state(10, 5, 4).
state(12, 6, 19).
state(4, 7, 9).
state(5, 7, 14).
state(18, 8, 2).
state(8, 10, 18).
state(19, 11, 3).
state(9, 12, 13).
state(11, 12, 4).
state(11, 13, 10).
state(16, 14, 19).
state(3, 15, 3).
state(12, 15, 13).
state(4, 16, 3).
state(16, 19, 16).
state(5, 20, 4).
state(14, 20, 7).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

