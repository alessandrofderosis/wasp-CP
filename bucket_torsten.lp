#const lasttime=1.

bucket(a;b).
%amount(1..1).
amount(1..2).
time(0..lasttime).

#external __constraint/3.
#external __constraint/5.

__constraint(volume(a,0), "$==", 0).
__constraint(volume(b,0), "$==", 1).
down(X,T) :- __constraint(volume(X,T), "$>", volume(Y,T)), bucket(X;Y), time(T).
up(X,T) :- __constraint(volume(X,T), "$<", volume(Y,T)), bucket(X;Y), time(T).
balance(T) :- __constraint(volume(X,T), "$==", volume(Y,T)), bucket(X;Y), X != Y, time(T).

:-     pour(B,T,A), bucket(B), time(T), T<lasttime, amount(A), __constraint(volume(B,T+1), "$!=", volume(B,T), "$+", A) .
:-not  pour(B,T),   bucket(B), time(T), T<lasttime, amount(A), __constraint(volume(B,T+1), "$!=", volume(B,T))  .


pour(B,T) :- pour(B,T,A).

1{ pour(X,T,A) : bucket(X) : amount(A) } 1 :- time(T).

:- up(a,lasttime).


%volume(B,T) $>=0 :- bucket(B), time(T).
%volume(B,T) $<10 :- bucket(B), time(T).

__constraint("$domain(0..1)").

#hide bucket/1.
#hide time/1.

%*
{__constraint(volume(X,T), "$>", volume(Y,T))}:-bucket(X;Y), time(T).
{__constraint(volume(X,T), "$<", volume(Y,T))}:-bucket(X;Y), time(T).
{__constraint(volume(X,T), "$==", volume(Y,T))} :- bucket(X;Y), time(T),X!=Y.
{__constraint(volume(B,T+1), "$!=", volume(B,T), "$+", A)}:- pour(B,T,A), bucket(B), time(T), T<lasttime, amount(A).
{__constraint(volume(B,T+1), "$!=", volume(B,T))}:- not pour(B,T),   bucket(B), time(T), T<lasttime, amount(A).
*%
