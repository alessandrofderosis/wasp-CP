#!/usr/bin/python
import os, sys


encoding='__constraint("$domain(1..20)").\n:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.\n:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.\n__constraint(v(X,Y), "$==", S) :- state(X,Y,S).\nstate(X,Y):-state(X,Y,S).\n{__constraint(v(X,Y), "$==", V)}:- X = 1..n, Y = 1..n, V = 1..n, not state(X,Y).'
for file in os.listdir("."):
    if not os.path.isfile(os.path.join(".", file)):
        continue
    source = open(file,"r")
    destination = open("dest/"+file,"w+")
    for line in source.readlines():
        if "$domain(1..n)." in line:
            destination.write(encoding)
            break
        else:
            destination.write(line)
            
    destination.close()
    source.close()
