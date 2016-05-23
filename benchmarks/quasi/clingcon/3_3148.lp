#const n=20.
state(15, 2, 16).
state(5, 3, 13).
state(1, 9, 11).
state(6, 12, 1).
state(9, 12, 14).
state(13, 14, 5).
state(14, 15, 20).
state(8, 18, 3).
state(6, 19, 18).
state(10, 20, 7).
state(13, 20, 10).
state(20, 20, 12).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

