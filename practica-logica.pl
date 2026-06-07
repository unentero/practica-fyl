%-------------------------------Nivel 1-----------------------------------
%1- Defina una función que calcule el cuadrado de un número
square(X,Y) :- Y is X*X.
% el = no es un comparativo logico, es un unificador. usa is
%2- Defina una función que determine el valor absoluto de un número.
abs(X,Y) :- X>=0 -> Y is X.
abs(X,Y) :- X<0 -> Y is -X.
%3- Defina una función que realice el siguiente cálculo, para el parámetro n: F(n) = n * (n - 1) / 2.
funcion(X,Y) :- Y is X * (X-1) / 2.
%-------------------------------Nivel 2-----------------------------------
%4- Defina una función que calcule la enésima potencia de un número.
enesimaPotencia(_,0,Y) :- Y is 1.
enesimaPotencia(X,N,Y) :- N>0, N1 is N-1, enesimaPotencia(X,N1,Y1), Y is X*Y1. 
%5- Escriba una función llamada “Cantidad” que devuelva la cantidad de elementos de una lista.
cantidad([],Y) :- Y is 0.
cantidad([_|T],Y) :- cantidad(T,Y1), Y is 1+Y1.
%6- Escriba una función llamada “Sumatoria” que devuelva la suma de elementos de una lista.
sumatoria([],Y) :- Y is 0.
sumatoria([H|T],Y) :- sumatoria(T,Y1), Y is H+Y1.
%7- Realice una función que devuelva el i-ésimo elemento de una lista.
iesimo([H|_],1,I) :- I is H.
iesimo([_|T],N,I) :- N>1, N1 is N-1, iesimo(T,N1,I1), I is I1.
%8- Elimine el i-ésimo elemento de una lista.
eliminar_iesimo([_|T],1,T).
eliminar_iesimo([H|T],N,[H|I1]) :- N>1, N1 is N-1, eliminar_iesimo(T,N1,I1). 
% is no se usa para listas:P
%9- Escriba una función llamada “Existe” que indique si un objeto se encuentra dentro de una lista determinada.
existe(X,[X|_]). 
existe(X,[_|T]):-existe(X,T).
%10- Escriba una función que determine la Media de una lista de números.
media([],M):- M is 0.
media(T,M):-sumatoria(T,S), cantidad(T,C), M is S/C.
%11- Agregue un elemento a una lista en una posición dada.
agregar_en(X,[],_,L) :- L = [X].
agregar_en(X,T,1,L) :- L = [X|T].
agregar_en(X,[H|T],N,L) :- N>1,N1 is N-1, agregar_en(X,T,N1,L1),L = [H|L1].
%12- Agregue un elemento a una lista ordenada, en el lugar que le corresponda.
agregar_orden(X,[],L) :- L = [X].
agregar_orden(X,[H|T],L):- L0 = [H|T], agregar_orden(X,T,L1),(X=<H -> L = [X|L0]; L = [H|L1]).
%13- Realice un programa que calcule la sumatoria de las tres primeras
%potencias (es decir el número, el número al cuadrado y al cubo) de un número dado.