#const n=20.
state(8, 1, 11).
state(13, 1, 5).
state(12, 2, 15).
state(19, 2, 10).
state(9, 3, 2).
state(11, 3, 15).
state(16, 3, 18).
state(18, 4, 4).
state(11, 5, 10).
state(20, 5, 17).
state(14, 6, 5).
state(3, 7, 3).
state(10, 7, 5).
state(16, 7, 19).
state(20, 7, 6).
state(8, 9, 17).
state(19, 9, 20).
state(11, 10, 19).
state(16, 10, 20).
state(14, 11, 2).
state(11, 13, 1).
state(10, 14, 4).
state(11, 14, 12).
state(17, 14, 20).
state(18, 14, 11).
state(4, 16, 7).
state(6, 16, 18).
state(17, 16, 1).
state(6, 17, 2).
state(5, 18, 8).
state(16, 18, 7).
state(9, 19, 5).
state(13, 19, 20).
state(15, 20, 19).
state(18, 20, 9).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

