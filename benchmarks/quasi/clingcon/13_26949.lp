#const n=20.
state(2, 1, 3).
state(4, 1, 15).
state(6, 1, 7).
state(7, 1, 13).
state(12, 1, 5).
state(14, 2, 1).
state(12, 4, 18).
state(7, 5, 16).
state(15, 5, 20).
state(3, 6, 1).
state(6, 6, 2).
state(7, 6, 5).
state(8, 6, 7).
state(13, 6, 19).
state(16, 6, 12).
state(8, 7, 9).
state(4, 8, 18).
state(10, 8, 4).
state(1, 9, 15).
state(3, 9, 17).
state(3, 10, 10).
state(16, 10, 7).
state(4, 11, 11).
state(8, 11, 14).
state(18, 11, 12).
state(20, 11, 16).
state(4, 12, 4).
state(9, 12, 2).
state(19, 12, 12).
state(5, 13, 8).
state(16, 13, 17).
state(17, 13, 14).
state(18, 13, 16).
state(19, 13, 5).
state(7, 14, 7).
state(19, 14, 9).
state(4, 15, 6).
state(9, 16, 14).
state(16, 16, 3).
state(7, 17, 8).
state(13, 17, 14).
state(4, 18, 9).
state(8, 18, 20).
state(18, 18, 5).
state(1, 19, 3).
state(4, 19, 20).
state(14, 19, 4).
state(19, 19, 17).
state(20, 19, 7).
state(8, 20, 12).
state(16, 20, 16).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

