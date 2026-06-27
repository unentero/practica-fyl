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
%26. Realice una función que transforme un entero decimal a binario, expresado como lista de {0,1}.
decimal_a_binario(0,[]).
decimal_a_binario(N,B):- N1 is N mod 2, N2 is N div 2,decimal_a_binario(N2,B1),B=[N1|B1].
%27. Escriba una función llamada “Palíndromo” que indique si una lista es Palíndromo (capicúa). 
listas_iguales([],[]).
listas_iguales([H1|T1],[H2|T2]):- H1 =:= H2,listas_iguales(T1,T2).
%28. Escriba una función que determine si una lista de {0,1}, donde cada 0 representa un 
%paréntesis que abre y cada 1 un paréntesis que cierra, está balanceada (es decir, que cada 0 
%tiene su 1 correspondiente de acuerdo a las reglas que siguen los paréntesis). Ej: (001101) 
%está balanceada y (1001010) no lo está.
parentesis_balanceados_bin([]).
parentesis_balanceados_bin(L):- contar_instancias_de(1,L,U),contar_instancias_de(0,L,C), U =:= C.
%29. Defina una función que tome como entrada una lista de números entre el 1 y el 3, y devuelva 
%un par ordenado con el número que mayor cantidad de veces aparece en la lista original y su frecuencia.
funcion_29(L,R):- moda(L,M),contar_instancias_de(M,L,C),R=[M,C].
%30. Realice un programa que, dado un número N, calcule el mayor valor de la serie de Fibonacci que sea 
%menor que N. La serie está dada por: 0, 1, 1, 2, 3, 5, 8, 13, ... ; donde los  primeros números son 0 y 1, 
%y los demás se calculan como la suma de los dos anteriores.
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,R):- N>1,N1 is N-1,N2 is N-2,fibonacci(N1,R1),fibonacci(N2,R2), R is R1+R2.
fibonacci_hasta(X,N,R):-fibonacci(N,F),(F > X -> N1 is N-1,fibonacci_hasta(X,N1,R);F < X -> R is F ; F =:= X -> N1 is N-1, fibonacci(N1,F1), R is F1).
fibonacci_menor_a(N,R):-fibonacci_hasta(N,N,R).
%31. Escriba una función llamada “intercalar” que intercale dos listas ordenadas manteniendo el orden 
%definido por las mismas. 
intercalar([],[],[]).
intercalar([H1|T1],[H2|T2],R):-intercalar(T1,T2,R1), R=[H1,H2|R1].
%32. Escriba una función que tome una lista y elimine las repeticiones adyacentes de sus elementos.
eliminar_adyacentes_de([],[]).
eliminar_adyacentes_de([X],[X]).
eliminar_adyacentes_de([X,X|T],R):- eliminar_adyacentes_de([X|T],R).
eliminar_adyacentes_de([H|T],R):- eliminar_adyacentes_de(T,R1), R=[H|R1].
%33. Escriba una función que tome un número y una lista conteniendo los coeficientes de un polinomio y 
%devuelva el resultado del mismo reemplazando el número por la variable:
%Ej. para (2 5 4 50 3) y 3 el polinomio en x es  2 + 5 x + 4 x2 + 50 x3 + 3 x4 ,  donde x=3.
evaluar_polinomio(_,[],0).
evaluar_polinomio(X,[H|T],R):-tamanio(T,N),evaluar_polinomio(X,T,R1) ,R is H*(X**N) + R1.
evaluar_polinomio_final(X,L,R):- reverse(L,LI),evaluar_polinomio(X,LI,R).
%34. Dadas dos listas de números defina una función devuelva una tercera, cuyos elementos sean resultado 
%    del siguiente cálculo:
%    Parámetros: L1, L2 listas de números.
%    Resultado: L3 lista de números
%    L3(1) = L1(1)*L2(1) + L1(1)*L2(2) + ... + L1(1)*L2(N)
%    L3(2) = L1(2)*L2(1) + L1(2)*L2(2) + ... + L1(2)*L2(N)
%    . . . .
%    L3(M) = L1(M)*L2(1) + L1(M)*L2(2) + ... + L1(M)*L2(N)
escalar_vector(_,[],0).
escalar_vector(X,[H|T],R):- escalar_vector(X,T,R1), R is X*H + R1.
vector_escalar_vec([],_,[]).
vector_escalar_vec([H1|T1],L2,R):- escalar_vector(H1,L2,R1),vector_escalar_vec(T1,L2,R2), R=[R1|R2].
%35. Considere que cada conjunto se representa mediante una lista. Defina funciones para simular:
pertenece(X,[X|_]).
pertenece(X,[H|T]):- X =\= H, pertenece(X,T).
%a. Unión de conjuntos.
union([],[],[]).
union([],L,L).
union([H1|T1],[H2|T2],R):- 
(H1 =\= H2 -> union(T1,T2,R1),R=[H1,H2|R1]; 
H2 =:= H2 -> union(T1,T2,R1),R=[H1,H2|R1]).  
%b. Intersección de conjuntos.
interseccion([],_,[]).
interseccion([H1|T1],L2,R):- 
(pertenece(H1,L2) -> interseccion(T1,L2,R1), R=[H1|R1]; interseccion(T1,L2,R)).
%c. Diferencia de conjuntos.
diferencia([],_,[]).
diferencia([H1|T1],L2,R):- 
(\+(pertenece(H1,L2)) -> diferencia(T1,L2,R1), R=[H1|R1]; diferencia(T1,L2,R)).
%d. Diferencia simétrica de conjuntos.
diferencia_simetrica([],[],[]).
diferencia_simetrica(L,[],L).
diferencia_simetrica([H1|T1],[H2|T2],R):- union([H1|T1],[H2|T2],U),interseccion([H1|T1],[H2|T2],I),diferencia(U,I,R).
%36. Escriba una función que tome una lista como entrada y genere una nueva lista con la primera mitad de 
%la lista original como segundo elemento y la segunda mitad como primer elemento.
%    (x1, x2, x3, x4, x5, x6)  -->  ( (x4, x5, x6), (x1, x2, x3) ).
recortar_lista_hasta([],_,[]).
recortar_lista_hasta(_,0,[]).
recortar_lista_hasta([H|T],N,LR):- N1 is N-1,recortar_lista_hasta(T,N1,LR1) , LR = [H|LR1].
biparticion_rara(L,[L1,L2]):-tamanio(L,T), N is div(T+1,2),N1 is div(T,2), reverse(L,LI), recortar_lista_hasta(LI,N,LI1),recortar_lista_hasta(L,N1,L2),reverse(LI1,L1). 
%37. Escriba una función que tome dos listas y determine si la secuencia de elementos de la primera se 
%encuentra dentro de la segunda.
empieza_con([],_).
empieza_con([H1|T1],[H2|T2]):- (H1 =:= H2 -> empieza_con(T1,T2)).
sublista([H1|T1],[H2|T2]):- (H1 =\= H2 -> empieza_con([H1|T1],T2);H1 =:= H2 -> empieza_con(T1,T2)).
%38. Escriba una función que tome como entrada tres listas y determine si la tercera se puede formar a 
%partir de los elementos de las dos primeras.
is_lineal_combination(_,_,[]).
is_lineal_combination(L1,L2,[H3|T3]):-(pertenece(H3,L1);pertenece(H3,L2)->is_lineal_combination(L1,L2,T3)).
%-------------------------------Nivel 4-----------------------------------
%39. Escriba una función llamada "Cantidad-de" que toma como argumentos una lista y una condición (función), 
%y  devuelve la cantidad de elementos de la lista que cumplen con dicha condición.
cantidad_de([],_Condicion,0).
cantidad_de([H|T],Condicion,R):-(call(Condicion,H)-> cantidad_de(T,Condicion,R1),R is 1 + R1 ; cantidad_de(T,Condicion,R)).
even(N):- N mod 2 =:= 0.
%40. Defina una función que tome una lista de números y una condición (función) como parámetros y devuelva 
%la sumatoria de los elementos que cumplen dicha condición.
sumatoria_de([],_Condicion,0).
sumatoria_de([H|T],Condicion,R):-(call(Condicion,H)-> sumatoria_de(T,Condicion,R1),R is H + R1 ; sumatoria_de(T,Condicion,R)).
%41. Defina una función llamada “Select” que devuelva la lista de elementos que cumplen con una determinada 
%condición. 
select([],_Condicion,[]).
select([H|T],Condicion,R):-(call(Condicion,H)-> select(T,Condicion,R1),R = [H|R1] ; select(T,Condicion,R)).
%42. Defina una función llamada “Map” o “Collect” que devuelva la lista de los resultados de aplicar una 
%función que se pasa como parámetro a cada elemento de la lista de entrada. 
map([],_,[]).
map([H|T],Funcion,R):- map(T,Funcion,R1),call(Funcion,H,Hf),R=[Hf|R1].
sumar(X,Y):-Y is X+1.
%43. Escriba una función llamada “intercalar-según” que tome dos listas y una función como entrada, y 
%construya una nueva lista resultado de intercalar las dos primeras en el orden establecido por la función 
%(es decir, que la función se aplica a los dos elementos que se comparan en cada momento para determinar cuál es el mayor).
intercalar_segun([],[],_,[]).
intercalar_segun([H1|T1],[H2|T2],Func,R):-(call(Func,H1,H1f),call(Func,H2,H2f),H1f > H2f -> 
intercalar_segun(T1,T2,Func,R1), R=[H1,H2|R1];
call(Func,H1,H1f),call(Func,H2,H2f),H1f < H2f->
intercalar_segun(T1,T2,Func,R1), R=[H2,H1|R1];
intercalar_segun(T1,T2,Func,R1), R=[H1,H2|R1]).