#const n=20.
state(9, 2, 15).
state(14, 2, 1).
state(17, 3, 4).
state(7, 4, 7).
state(20, 4, 14).
state(7, 5, 19).
state(17, 5, 5).
state(4, 6, 8).
state(9, 6, 19).
state(11, 6, 1).
state(19, 7, 14).
state(5, 8, 5).
state(14, 9, 7).
state(2, 10, 13).
state(5, 10, 7).
state(15, 11, 12).
state(2, 12, 3).
state(8, 12, 12).
state(10, 12, 11).
state(4, 13, 12).
state(14, 13, 18).
state(3, 15, 2).
state(4, 15, 14).
state(10, 15, 17).
state(1, 17, 6).
state(6, 17, 5).
state(9, 17, 11).
state(2, 18, 15).
state(4, 18, 2).
state(5, 19, 19).
state(11, 20, 6).
state(17, 20, 13).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

