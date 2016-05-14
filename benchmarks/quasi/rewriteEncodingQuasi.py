#!/usr/bin/python
import os, sys


encoding="""__constraint("$domain(1..20)").
:-__constraint(v(X1,Y), "$==", V), __constraint(v(X2,Y),"$==", V), X1 = 1..n, X2 = 1..n, X1 < X2, Y = 1..n, V = 1..n.
:-__constraint(v(X,Y1), "$==", V), __constraint(v(X,Y2),"$==", V), Y1 = 1..n, Y2 = 1..n, Y1 < Y2, X = 1..n, V = 1..n.
:- state(X,Y,S),__constraint(v(X,Y), "$!=", S).

#external __constraint/3."""
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
