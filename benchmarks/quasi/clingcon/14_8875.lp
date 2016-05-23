#const n=20.
state(4, 1, 14).
state(6, 1, 18).
state(8, 1, 3).
state(16, 2, 18).
state(2, 3, 20).
state(4, 3, 11).
state(15, 3, 14).
state(6, 4, 19).
state(9, 4, 12).
state(13, 4, 14).
state(17, 4, 18).
state(7, 5, 13).
state(10, 5, 2).
state(4, 6, 19).
state(6, 6, 17).
state(11, 6, 12).
state(14, 6, 7).
state(5, 7, 15).
state(7, 7, 10).
state(1, 8, 3).
state(18, 8, 14).
state(20, 8, 2).
state(1, 9, 20).
state(5, 9, 12).
state(1, 10, 2).
state(3, 10, 10).
state(8, 10, 9).
state(16, 10, 5).
state(17, 10, 17).
state(20, 10, 8).
state(2, 11, 10).
state(11, 11, 13).
state(12, 11, 20).
state(20, 11, 9).
state(9, 12, 5).
state(13, 12, 2).
state(18, 12, 7).
state(10, 13, 20).
state(14, 13, 8).
state(18, 13, 5).
state(4, 14, 8).
state(8, 14, 6).
state(14, 14, 13).
state(15, 14, 20).
state(15, 16, 10).
state(1, 17, 8).
state(7, 17, 3).
state(8, 17, 13).
state(4, 18, 1).
state(16, 18, 11).
state(3, 19, 16).
state(10, 19, 11).
state(12, 19, 7).
state(15, 19, 15).
state(17, 19, 20).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

