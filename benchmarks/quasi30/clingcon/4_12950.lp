#const n=30.
$domain(1..n).
:-v(X1,Y) $== V, v(X2,Y) $== V, X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-v(X,Y1) $== V, v(X,Y2) $== V, Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
v(X,Y) $== S :- state(X,Y,S).

state(2, 1, 18).
state(12, 1, 10).
state(11, 2, 16).
state(12, 2, 3).
state(2, 7, 27).
state(7, 7, 16).
state(9, 7, 28).
state(5, 8, 12).
state(12, 8, 2).
state(16, 9, 28).
state(28, 9, 12).
state(13, 11, 23).
state(21, 11, 24).
state(27, 11, 14).
state(19, 12, 12).
state(26, 12, 17).
state(28, 12, 30).
state(12, 13, 4).
state(13, 13, 9).
state(20, 13, 18).
state(18, 17, 24).
state(1, 18, 1).
state(19, 20, 11).
state(1, 21, 21).
state(19, 22, 15).
state(20, 22, 6).
state(23, 23, 25).
state(26, 23, 24).
state(5, 24, 2).
state(7, 24, 25).
state(28, 24, 20).
state(16, 26, 15).
state(23, 27, 28).
state(6, 29, 5).
state(28, 30, 18).
