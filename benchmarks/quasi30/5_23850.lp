#const n=30.

state(10, 1, 11).
state(11, 1, 26).
state(24, 2, 25).
state(26, 3, 23).
state(28, 4, 28).
state(16, 5, 17).
state(4, 6, 26).
state(13, 6, 27).
state(18, 8, 13).
state(27, 8, 3).
state(1, 9, 19).
state(13, 9, 1).
state(15, 9, 13).
state(17, 9, 10).
state(29, 11, 16).
state(30, 11, 13).
state(9, 13, 30).
state(18, 13, 17).
state(19, 13, 9).
state(24, 13, 19).
state(25, 13, 26).
state(9, 14, 4).
state(7, 15, 25).
state(29, 15, 30).
state(12, 17, 12).
state(18, 19, 25).
state(27, 19, 9).
state(5, 20, 3).
state(10, 20, 15).
state(16, 20, 21).
state(19, 20, 8).
state(15, 21, 8).
state(26, 21, 3).
state(11, 23, 3).
state(15, 25, 15).
state(30, 26, 7).
state(6, 27, 25).
state(21, 27, 5).
state(2, 29, 23).
state(3, 29, 2).
state(6, 29, 19).
state(28, 29, 9).
state(16, 30, 13).
state(18, 30, 22).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
__constraint(v(X,Y), "$==", S) :- state(X,Y,S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).