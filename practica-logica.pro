%Nivel 1
%1- Defina una función que calcule el cuadrado de un número
square(X,Y) :- Y is X*X.
% el = no es un comparativo logico, es un unificador. usa is
%2- Defina una función que determine el valor absoluto de un número.
abs(X,Y) :- X>=0 -> X is Y.
abs(X,Y) :- X<0 -> X is (-1)*Y
%3- (NOT DONE) Defina una función que realice el siguiente cálculo, para el parámetro n: F(n) = n * (n - 1) / 2.
funcion(X,Y) :- Y is X * (X-1) / 2.

%Nivel 2
