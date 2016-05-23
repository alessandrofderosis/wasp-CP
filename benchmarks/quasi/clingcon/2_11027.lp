#const n=20.
state(9, 3, 7).
state(15, 5, 5).
state(11, 7, 12).
state(16, 12, 20).
state(7, 14, 9).
state(17, 16, 18).
state(6, 19, 7).
state(3, 20, 4).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

