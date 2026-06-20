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
sumatoria_potencias(X,P):- P is X + X*X + X*X*X.
%14- Escriba una función que tome una lista y un elemento como argumentos, y devuelva la lista
%original con todas las ocurrencias de dicho elemento eliminadas.
eliminar_ocurrencias(_,[],L) :- L = [].
eliminar_ocurrencias(X,[X|T],L) :- eliminar_ocurrencias(X,T,L1),L = L1.
eliminar_ocurrencias(X,[H|T],L) :- eliminar_ocurrencias(X,T,L1),L = [H|L1].
%15- Escriba una función llamada "reemplazo", que tome una lista y dos elementos como argumentos,
%y devuelva la lista original con todas las instancias del primer elemento reemplazadas por el
%segundo.
reemplazar_ocurrencias(_,_,[],L) :- L = [].
reemplazar_ocurrencias(X,Y,[X|T],L) :- reemplazar_ocurrencias(X,Y,T,L1),L = [Y|L1].
reemplazar_ocurrencias(X,Y,[H|T],L) :- reemplazar_ocurrencias(X,Y,T,L1),L = [H|L1].
%16- Escriba una función que devuelva el mínimo elemento de una lista.
minimo([X],MIN):- MIN is X.
minimo([H|T],MIN):- minimo(T,MIN1),(H<MIN1 -> MIN is H; MIN is MIN1). 
%17- Escriba una función que devuelva el máximo elemento de una lista.
maximo([X],MAX):- MAX is X.
maximo([H|T],MAX):- maximo(T,MAX1),(H>MAX1 -> MAX is H; MAX is MAX1).
%18- Defina una función que tome una lista de números y devuelva una 3-upla formada por el
%promedio, el máximo y el mínimo de la lista.
ejercicio_18([],E):- E = [0,0,0].
ejercicio_18(L,E):- media(L,M),maximo(L,MAX),minimo(L,MIN),E = [M,MAX,MIN].
%-------------------------------Nivel 3-----------------------------------
%19. Escriba una función que calcule el i-ésimo número perfecto (los números perfectos son aquellos 
%que son iguales a la suma de sus divisores).
lista_divisores(_, 0, []) :- !.
lista_divisores(X,N,L):- N>0, N1 is N-1, lista_divisores(X,N1,L1),(X mod N =:= 0 -> L = [N|L1]; L = L1).
es_numero_perfecto(X):- X>1, X1 is X-1,lista_divisores(X,X1,L),sumatoria(L,S),X =:= S.
iesimo_perfecto_desde(X,I,P):-
(I=:= 1,es_numero_perfecto(X)
-> P is X
; es_numero_perfecto(X)
-> X1 is X+1, I1 is I-1,iesimo_perfecto_desde(X1,I1,P)
; X1 is X+1,
iesimo_perfecto_desde(X1,I,P)
).
iesimo_perfecto(I,P):-iesimo_perfecto_desde(1,I,P).
%20. Escriba una función que calcule los n primeros números primos y los devuelva en una lista.
lista_n_divisores_primos(_,0,[]):- !.
lista_n_divisores_primos(1,_,L):- L = [1].
lista_n_divisores_primos(X,N,L):-(X mod N =:= 0, X =\= N, N =\= 1 
->N1 is N-1, lista_n_divisores_primos(X,N1,L1),L=[N|L1]
;N1 is N-1, lista_n_divisores_primos(X,N1,L1),L = L1).
es_primo(X):-lista_n_divisores_primos(X,X,[]).
lista_n_primos_desde(_,0,[]):- !.
lista_n_primos_desde(X,N,L):-(es_primo(X)
->X1 is X+1,N1 is N-1, lista_n_primos_desde(X1,N1,L1),L=[X|L1]
;X1 is X+1, lista_n_primos_desde(X1,N,L1),L = L1).
lista_n_primos(N,L):-lista_n_primos_desde(1,N,L).
%21. Escriba una función que determine la Varianza de una lista de números: 
%Varianza = Sumatoria (Xi - Media)2 / (n - 1). Siendo Xi cada uno de los n elementos de la lista.
sumatoria_varianza([],SV):- SV is 0.
sumatoria_varianza([H|T],SV):- media([H|T],M),sumatoria_varianza(T,SV1),SV is (H-M)**2 + SV1.
varianza(L,V):-sumatoria_varianza(L,SV),cantidad(L,C),V is SV/(C-1).
%22. Escriba una función que calcule la Moda de una lista de números (el número que más se repite).
contar_instancias_de(_,[],0).
contar_instancias_de(X,[X|T],C):- contar_instancias_de(X,T,C1), C is C1 + 1.
contar_instancias_de(X,[H|T],C):- X \= H, contar_instancias_de(X,T,C1), C is C1.
mas_repetido([],M,_,M).
mas_repetido([H|T],M,L,R):-(contar_instancias_de(H,L,C1),contar_instancias_de(M,L,C2),C1>C2 -> mas_repetido(T,H,L,R);mas_repetido(T,M,L,R)).
moda([H|T],M) :- mas_repetido(T,H,[H|T],M).
%23. Devuelva la cantidad de números que contiene una lista.
cantidad_numeros_en([],0).
cantidad_numeros_en([H|T],C):-(number(H) -> cantidad_numeros_en(T,C1),C is C1+1;cantidad_numeros_en(T,C)).
%24. Realice una función que transforme un binario, expresado a través de una lista de {0,1}, 
%en decimal.
tamanio([],0).
tamanio([_|T],R):- tamanio(T,R1),R is 1 + R1.
binario_a_decimal([],0).
binario_a_decimal([H|T],D):- tamanio(T,R),binario_a_decimal(T,D1), D is H*(2**R) + D1. 
%25. Realice una función que sume dos números binarios, expresados a través de dos listas de {0,1}.
suma_binaria([],[],0,[]).
suma_binaria([],[],1,[1]).
suma_binaria([1|T1],[1|T2],1,R):-suma_binaria(T1,T2,1,R1),R=[1|R1].
suma_binaria([1|T1],[1|T2],0,R):-suma_binaria(T1,T2,1,R1),R=[0|R1].
suma_binaria([1|T1],[0|T2],1,R):-suma_binaria(T1,T2,1,R1),R=[0|R1].
suma_binaria([1|T1],[0|T2],0,R):-suma_binaria(T1,T2,0,R1),R=[1|R1].
suma_binaria([0|T1],[1|T2],1,R):-suma_binaria(T1,T2,1,R1),R=[0|R1].
suma_binaria([0|T1],[1|T2],0,R):-suma_binaria(T1,T2,0,R1),R=[1|R1].
suma_binaria([0|T1],[0|T2],1,R):-suma_binaria(T1,T2,0,R1),R=[1|R1].
suma_binaria([0|T1],[0|T2],0,R):-suma_binaria(T1,T2,0,R1),R=[0|R1].
suma_binaria_definitiva(L1,L2,LR):-reverse(L1,L1I),reverse(L2,L2I),suma_binaria(L1I,L2I,0,LRI),reverse(LRI,LR).
