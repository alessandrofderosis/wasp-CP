#const n=20.
state(9, 1, 10).
state(10, 1, 16).
state(13, 1, 20).
state(1, 2, 6).
state(2, 2, 4).
state(4, 2, 10).
state(13, 2, 17).
state(1, 3, 3).
state(5, 3, 13).
state(6, 3, 6).
state(16, 3, 4).
state(10, 4, 19).
state(6, 5, 19).
state(9, 5, 16).
state(15, 5, 20).
state(17, 5, 6).
state(3, 6, 17).
state(5, 6, 9).
state(5, 7, 5).
state(6, 7, 1).
state(19, 7, 4).
state(14, 8, 15).
state(17, 8, 12).
state(19, 8, 5).
state(2, 9, 12).
state(5, 9, 16).
state(12, 9, 8).
state(8, 10, 10).
state(9, 10, 7).
state(11, 10, 1).
state(15, 10, 16).
state(18, 10, 15).
state(1, 11, 14).
state(14, 11, 4).
state(3, 12, 16).
state(8, 12, 1).
state(11, 12, 15).
state(16, 12, 3).
state(17, 12, 18).
state(5, 13, 7).
state(3, 14, 13).
state(7, 14, 20).
state(14, 14, 11).
state(18, 14, 5).
state(19, 14, 14).
state(3, 15, 14).
state(15, 15, 5).
state(18, 15, 18).
state(16, 16, 9).
state(14, 17, 9).
state(16, 17, 14).
state(7, 18, 9).
state(11, 18, 16).
state(14, 18, 12).
state(5, 19, 20).
state(11, 19, 10).
state(19, 19, 16).
state(3, 20, 12).
state(4, 20, 11).
state(14, 20, 14).
state(15, 20, 1).
state(19, 20, 10).
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

