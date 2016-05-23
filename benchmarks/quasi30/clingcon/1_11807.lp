#const n=30.
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

state(3, 2, 1).
state(25, 4, 19).
state(28, 5, 16).
state(8, 7, 19).
state(20, 11, 19).
state(25, 15, 22).
state(3, 26, 19).
state(19, 26, 9).
state(26, 28, 12).
