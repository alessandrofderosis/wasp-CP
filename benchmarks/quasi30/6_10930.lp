#const n=30.

state(3, 1, 1).
state(4, 1, 28).
state(5, 1, 26).
state(8, 1, 14).
state(13, 1, 3).
state(16, 1, 20).
state(7, 3, 12).
state(11, 3, 16).
state(12, 3, 3).
state(9, 4, 30).
state(23, 5, 1).
state(5, 7, 22).
state(17, 7, 9).
state(26, 7, 27).
state(14, 8, 18).
state(21, 8, 2).
state(26, 8, 22).
state(18, 9, 17).
state(22, 9, 27).
state(27, 10, 24).
state(5, 11, 5).
state(9, 11, 22).
state(28, 11, 21).
state(29, 11, 11).
state(9, 13, 18).
state(2, 14, 16).
state(29, 14, 15).
state(5, 15, 20).
state(3, 16, 24).
state(11, 16, 10).
state(1, 17, 13).
state(4, 18, 19).
state(30, 18, 24).
state(5, 19, 21).
state(10, 19, 4).
state(12, 20, 6).
state(27, 23, 16).
state(7, 24, 28).
state(12, 24, 4).
state(6, 25, 2).
state(8, 25, 13).
state(7, 26, 19).
state(9, 27, 1).
state(12, 27, 17).
state(15, 27, 26).
state(17, 27, 20).
state(15, 29, 20).
state(20, 29, 6).
state(14, 30, 5).
state(17, 30, 29).
state(18, 30, 25).
state(20, 30, 18).
__constraint("$domain(1..30)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
__constraint(v(X,Y), "$==", S) :- state(X,Y,S).
state(X,Y):-state(X,Y,S).
{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).