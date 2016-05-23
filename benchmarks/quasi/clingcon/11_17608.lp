#const n=20.
state(11, 1, 12).
state(17, 1, 6).
state(18, 2, 15).
state(10, 3, 19).
state(12, 3, 6).
state(15, 3, 4).
state(20, 3, 11).
state(2, 4, 3).
state(5, 4, 5).
state(8, 4, 19).
state(18, 4, 14).
state(13, 5, 1).
state(14, 5, 16).
state(1, 7, 14).
state(3, 7, 13).
state(8, 7, 12).
state(10, 8, 20).
state(19, 8, 5).
state(8, 9, 1).
state(13, 9, 18).
state(20, 10, 14).
state(2, 11, 6).
state(7, 12, 4).
state(3, 13, 12).
state(5, 13, 19).
state(6, 13, 6).
state(9, 13, 13).
state(18, 13, 8).
state(3, 14, 15).
state(19, 14, 9).
state(3, 15, 8).
state(3, 16, 18).
state(7, 16, 7).
state(9, 16, 11).
state(15, 16, 17).
state(1, 17, 17).
state(7, 18, 3).
state(9, 19, 5).
state(16, 19, 17).
state(17, 19, 10).
state(1, 20, 18).
state(4, 20, 17).
state(20, 20, 12).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

