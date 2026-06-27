#-------------------------------Nivel 1-----------------------------------
defmodule Nivel1 do
    #1- Defina una función que calcule el cuadrado de un número
    def square(0), do: 0
    def square(x), do: x*x
    #2- Defina una función que determine el valor absoluto de un número.
    def abs(x) do
       if (x<0) do
        (-1)*x
       else
        x
       end
    end
    #3- Defina una función que realice el siguiente cálculo, para el parámetro n: F(n) = n * (n - 1) / 2.
    def funcionx(n), do: n*(n-1)/2
end
#-------------------------------Nivel 2-----------------------------------
defmodule Nivel2 do
    #4- Defina una función que calcule la enésima potencia de un número.
    def enesimaPotencia(_,0), do: 1
    def enesimaPotencia(x,n), do: x*enesimaPotencia(x,n-1)
    #5- Escriba una función llamada “Cantidad” que devuelva la cantidad de elementos de una lista.
    def cantidad([]), do: 0
    def cantidad([_|t]), do: 1 + cantidad(t)
    #6- Escriba una función llamada “Sumatoria” que devuelva la suma de elementos de una lista.
    def sumatoria([]), do: 0
    def sumatoria([h|t]), do: h + sumatoria(t)
    #7- Realice una función que devuelva el i-ésimo elemento de una lista.
    def iesimo([],_), do: nil #se usa nil, no null
    def iesimo([h|_],1), do: h #paso basico
    def iesimo([_|t],n), do: iesimo(t,n-1) #paso inductivo
    #8- Elimine el i-ésimo elemento de una lista.
    def eliminar_iesimo([],_), do: []
    def eliminar_iesimo([_|t],1), do: t #paso basico
    def eliminar_iesimo([h|t],n), do: [h | eliminar_iesimo(t,n-1)] #paso inductivo
    #9. Escriba una función llamada “Existe” que indique si un objeto se encuentra dentro de una lista determinada.
    def existe(_,[]), do: false
    def existe(x,[x|_]), do: true
    def existe(x,[_|t]), do: existe(x,t)
    #10. Escriba una función que determine la Media de una lista de números.
    def media([]), do: 0
    def media(t), do: sumatoria(t)/cantidad(t)
    #11. Agregue un elemento a una lista en una posición dada.
    def agregar_en(x,[],_), do: [x]
    def agregar_en(x,t,1), do: [x|t]
    def agregar_en(x,[h|t],n), do: [h|agregar_en(x,t,n-1)]
    #12. Agregue un elemento a una lista ordenada, en el lugar que le corresponda.
    def agregar_orden(x,[]), do: [x]
    def agregar_orden(x,[h|t]=l) do
        if x <= h do
            [x|l]
        else
            [h|agregar_orden(x,t)]
        end
    end
    #13. Realice un programa que calcule la sumatoria de las tres primeras
    # potencias (es decir el número, el número al cuadrado y al cubo) de un número dado.
    def sumatoria_potencias(1), do: 3
    def sumatoria_potencias(x), do: x + x*x + x*x*x
    #14. Escriba una función que tome una lista y un elemento como argumentos, y devuelva la lista
    #original con todas las ocurrencias de dicho elemento eliminadas.
    def eliminar_ocurrencias(_,[]), do: []
    def eliminar_ocurrencias(x,[x]), do: []
    def eliminar_ocurrencias(x,[h|t]) do
        if x == h do
            eliminar_ocurrencias(x,t)
        else
            [h|eliminar_ocurrencias(x,t)]
        end
    end
    #15. Escriba una función llamada "reemplazo", que tome una lista y dos elementos como argumentos,
    #y devuelva la lista original con todas las instancias del primer elemento reemplazadas por el
    #segundo.
    def reemplazar_ocurrencias(_,_,[]), do: []
    def reemplazar_ocurrencias(x,y,[x|t]), do: [y|reemplazar_ocurrencias(x,y,t)]
    def reemplazar_ocurrencias(x,y,[h|t]), do: [h|reemplazar_ocurrencias(x,y,t)]
    #16. Escriba una función que devuelva el mínimo elemento de una lista.
    def minimo([x]), do: x
    def minimo([h|t]) do
        if h < minimo(t) do
            h
        else
            minimo(t)
        end
    end
    #17. Escriba una función que devuelva el máximo elemento de una lista.
    def maximo([x]), do: x
    def maximo([h|t]) do
        if h > maximo(t) do
            h
        else
            maximo(t)
        end
    end
    #18. Defina una función que tome una lista de números y devuelva una 3-upla formada por el
    #promedio, el máximo y el mínimo de la lista.
    def ejercicio_18([]), do: {0,0,0}
    def ejercicio_18(l), do: {media(l),maximo(l),minimo(l)}
end
#-------------------------------Nivel 3-----------------------------------
defmodule Nivel3 do
    #19. Escriba una función que calcule el i-ésimo número perfecto (los números perfectos son
    # aquellos que son iguales a la suma de sus divisores).
    def lista_divisores(_,0), do: []
    def lista_divisores(x,n) do
        if rem(x,n) == 0 do
            [n|lista_divisores(x,n-1)]
        else
            lista_divisores(x,n-1)
        end
    end
    def sumatoria([]), do: 0
    def sumatoria([h|t]), do: h + sumatoria(t)
    def es_numero_perfecto(x), do: x == sumatoria(lista_divisores(x,x-1))
    def iesimo_perfecto_desde(x,i) do
        cond do
            i==1 and es_numero_perfecto(x) -> x
            es_numero_perfecto(x) -> iesimo_perfecto_desde(x+1,i-1)
            true -> iesimo_perfecto_desde(x+1,i)
        end
    end
    def iesimo_perfecto(i), do: iesimo_perfecto_desde(1,i)
    #20. Escriba una función que calcule los n primeros números primos y los devuelva en una lista.
    def lista_n_divisores_primos(_,0), do: []
    def lista_n_divisores_primos(1,_), do: [1]
    def lista_n_divisores_primos(x,n) do
        if rem(x,n)==0 and x != n and n != 1 do
            [n|lista_n_divisores_primos(x,n-1)]
        else
            lista_n_divisores_primos(x,n-1)
        end
    end
    def es_primo(x), do: lista_n_divisores_primos(x,x) == []
    def lista_n_primos_desde(_,0), do: []
    def lista_n_primos_desde(x,n) do
        if es_primo(x) do
            [x|lista_n_primos_desde(x+1,n-1)]
        else
            lista_n_primos_desde(x+1,n)
        end
    end
    def lista_n_primos(n), do: lista_n_primos_desde(1,n)
    #21. Escriba una función que determine la Varianza de una lista de números:
    #Varianza = Sumatoria (Xi - Media)2 / (n - 1). Siendo Xi cada uno de los n elementos de la lista.
    def cantidad([]), do: 0
    def cantidad([_|t]), do: 1 + cantidad(t)
    def media([]), do: 0
    def media(l), do: sumatoria(l)/cantidad(l)
    def sumatoria_varianza([]), do: 0
    def sumatoria_varianza([h|t]=l), do: (h - media(l))**2 + sumatoria_varianza(t)
    def varianza(l), do: sumatoria_varianza(l)/(cantidad(l)-1)
    #22. Escriba una función que calcule la Moda de una lista de números
    #(el número que más se repite).
    def contar_instancias_de(_,[]), do: 0
    def contar_instancias_de(x,[x|t]), do: 1 + contar_instancias_de(x,t)
    def contar_instancias_de(x,[_|t]), do: contar_instancias_de(x,t)
    def mas_repetido([],m,_), do: m #si la lista de valores esta vacía, m es la moda de la lista de comparacion
    def mas_repetido([h|t],m,l) do #si la lista de valores NO esta vacia, comparamos
        cond do
            contar_instancias_de(h,l) > contar_instancias_de(m,l) -> mas_repetido(t,h,l) #recursivamente vamos quitando valores de lista de entrada, pero mantenemos una copia con la q comparamos uno a uno
            true -> mas_repetido(t,m,l) #si la cabeza de la lista de entrada tiene menos repeticiones que la moda actual m, entonces recursivamente decrecemos la lista
        end
    end
    def moda([h|t]), do: mas_repetido(t,h,[h|t])
    #23. Devuelva la cantidad de números que contiene una lista.
    def cantidad_numeros_en([]), do: 0
    def cantidad_numeros_en([h|t]) do
        if is_number(h) do
            1 + cantidad_numeros_en(t)
        else
            cantidad_numeros_en(t)
        end
    end
    #24. Realice una función que transforme un binario, expresado a través de una lista de {0,1},
    #en decimal.
    def tamanio([]), do: 0
    def tamanio([_|t]), do: 1 + tamanio(t)
    def binario_a_decimal([]), do: 0
    def binario_a_decimal([h|t]), do: h*(2**(tamanio(t))) + binario_a_decimal(t)
    #25. Realice una función que sume dos números binarios, expresados a través de dos listas de {0,1}.
    def suma_binaria([],[],0), do: []
    def suma_binaria([],[],1), do: [1]
    def suma_binaria([1|t1],[1|t2],1), do: [1|suma_binaria(t1,t2,1)]
    def suma_binaria([1|t1],[1|t2],0), do: [0|suma_binaria(t1,t2,1)]
    def suma_binaria([1|t1],[0|t2],1), do: [0|suma_binaria(t1,t2,1)]
    def suma_binaria([1|t1],[0|t2],0), do: [1|suma_binaria(t1,t2,0)]
    def suma_binaria([0|t1],[1|t2],1), do: [0|suma_binaria(t1,t2,1)]
    def suma_binaria([0|t1],[1|t2],0), do: [1|suma_binaria(t1,t2,0)]
    def suma_binaria([0|t1],[0|t2],1), do: [1|suma_binaria(t1,t2,0)]
    def suma_binaria([0|t1],[0|t2],0), do: [0|suma_binaria(t1,t2,0)]
    def suma_binaria_definitiva(l1,l2), do: Enum.reverse(suma_binaria(Enum.reverse(l1),Enum.reverse(l2),0))
    #26. Realice una función que transforme un entero decimal a binario, expresado como lista de {0,1}.
    def decimal_a_binario(0), do: []
    def decimal_a_binario(n), do: [rem(n,2)|decimal_a_binario(div(n,2))]
    #27. Escriba una función llamada “Palíndromo” que indique si una lista es Palíndromo (capicúa).
    def listas_iguales([],[]), do: true
    def listas_iguales([h1|t1],[h2|t2]) do
        cond do
            h1 == h2 and listas_iguales(t1,t2)->true
            h1 != h2 -> false
        end
    end
    def palindromo(l), do: listas_iguales(l,Enum.reverse(l))
    #28. Escriba una función que determine si una lista de {0,1}, donde cada 0 representa un
    #paréntesis que abre y cada 1 un paréntesis que cierra, está balanceada (es decir, que cada 0
    #tiene su 1 correspondiente de acuerdo a las reglas que siguen los paréntesis). Ej: (001101)
    #está balanceada y (1001010) no lo está.
    def parentesis_balanceados_bin([]), do: true
    def parentesis_balanceados_bin(l), do: contar_instancias_de(1,l) == contar_instancias_de(0,l)
    #29. Defina una función que tome como entrada una lista de números entre el 1 y el 3, y devuelva
    #un par ordenado con el número que mayor cantidad de veces aparece en la lista original y su frecuencia.
    def funcion_29(l), do: [moda(l),contar_instancias_de(moda(l),l)]
    #30. Realice un programa que, dado un número N, calcule el mayor valor de la serie de Fibonacci que sea
    #menor que N. La serie está dada por: 0, 1, 1, 2, 3, 5, 8, 13, ... ; donde los  primeros números son 0 y 1,
    #y los demás se calculan como la suma de los dos anteriores.
    def fibonacci(0), do: 0
    def fibonacci(1), do: 1
    def fibonacci(n) when n > 1, do: fibonacci(n-2) + fibonacci(n-1)
    def fibonacci_hasta(x,n) do
        cond do
            fibonacci(n) > x -> fibonacci_hasta(x,n-1)
            fibonacci(n) < x -> fibonacci(n)
            fibonacci(n) == x -> fibonacci(n-1)
        end
    end
    def fibonacci_menor_a(n), do: fibonacci_hasta(n,n)
    #31. Escriba una función llamada “intercalar” que intercale dos listas ordenadas manteniendo el orden
    #definido por las mismas.
    def intercalar([],[]), do: []
    def intercalar([h1|t1],[h2|t2]), do: [h1,h2|intercalar(t1,t2)]
    #32. Escriba una función que tome una lista y elimine las repeticiones adyacentes de sus elementos.
    def eliminar_adyacentes_de([]), do: []
    def eliminar_adyacentes_de([x]), do: [x]
    def eliminar_adyacentes_de([x,x|t]), do: eliminar_adyacentes_de([x|t])
    def eliminar_adyacentes_de([h|t]), do: [h|eliminar_adyacentes_de(t)]
    #33. Escriba una función que tome un número y una lista conteniendo los coeficientes de un polinomio y
    #devuelva el resultado del mismo reemplazando el número por la variable:
    #Ej. para (2 5 4 50 3) y 3 el polinomio en x es  2 + 5 x + 4 x2 + 50 x3 + 3 x4 ,  donde x=3.
    def evaluar_polinomio(_,[]), do: 0
    def evaluar_polinomio(x,[h|t]), do: h*(x**(tamanio(t))) + evaluar_polinomio(x,t)
    def evaluar_polinomio_final(x,l), do: evaluar_polinomio(x,Enum.reverse(l))
    #34. Dadas dos listas de números defina una función devuelva una tercera, cuyos elementos sean resultado
    #    del siguiente cálculo:
    #    Parámetros: L1, L2 listas de números.
    #    Resultado: L3 lista de números
    #    L3(1) = L1(1)*L2(1) + L1(1)*L2(2) + ... + L1(1)*L2(N)
    #    L3(2) = L1(2)*L2(1) + L1(2)*L2(2) + ... + L1(2)*L2(N)
    #    . . . .
    #    L3(M) = L1(M)*L2(1) + L1(M)*L2(2) + ... + L1(M)*L2(N)
    def escalar_vector(_,[]), do: 0
    def escalar_vector(x,[h|t]), do: x*h + escalar_vector(x,t)
    def vector_escalar_vec([],_), do: []
    def vector_escalar_vec([h1|t1],l2), do: [escalar_vector(h1,l2)|vector_escalar_vec(t1,l2)]
    #35. Considere que cada conjunto se representa mediante una lista. Defina funciones para simular:
    def pertenece(_,[]), do: false
    def pertenece(x,[x|_]), do: true
    def pertenece(x,[h|t]) when x != h, do: pertenece(x,t)
    #a. Unión de conjuntos.
    def union([],[]), do: []
    def union([],l), do: l
    def union([h1|t1],[h2|t2]) do
        cond do
            h1 != h2 -> [h1,h2|union(t1,t2)]
            h1 == h2 -> [h1|union(t1,t2)]
        end
    end
    #b. Intersección de conjuntos.
    def interseccion([],_), do: []
    def interseccion([h1|t1],l2) do
        cond do
            pertenece(h1,l2) -> [h1|interseccion(t1,l2)]
            true -> interseccion(t1,l2)
        end
    end
    #c. Diferencia de conjuntos.
    def diferencia([],_), do: []
    def diferencia([h1|t1],l2) do
        cond do
            not(pertenece(h1,l2)) -> [h1|diferencia(t1,l2)]
            true -> diferencia(t1,l2)
        end
    end
    #d. Diferencia simétrica de conjuntos.
    def diferencia_simetrica([],[]), do: []
    def diferencia_simetrica(l,[]), do: l
    def diferencia_simetrica([h1|t1],[h2|t2]), do: diferencia(union([h1|t1],[h2|t2]),interseccion([h1|t1],[h2|t2]))
    #36. Escriba una función que tome una lista como entrada y genere una nueva lista con la primera mitad de
    #la lista original como segundo elemento y la segunda mitad como primer elemento.
    #    (x1, x2, x3, x4, x5, x6)  -->  ( (x4, x5, x6), (x1, x2, x3) ).
    def recortar_lista_hasta([],_), do: []
    def recortar_lista_hasta(_,0), do: []
    def recortar_lista_hasta([h|t],n), do: [h|recortar_lista_hasta(t,n-1)]
    def biparticion_rara(l), do: [Enum.reverse(recortar_lista_hasta(Enum.reverse(l),div(tamanio(l)+1,2))),recortar_lista_hasta(l,div(tamanio(l),2))]
    #37. Escriba una función que tome dos listas y determine si la secuencia de elementos de la primera se
    #encuentra dentro de la segunda.
    def empieza_con([],_), do: true
    def empieza_con([h1|t1],[h2|t2]) do
        cond do
            h1 != h2 -> false
            h1 == h2 -> empieza_con(t1,t2)
        end
    end
    def sublista(_,[]), do: false
    def sublista([h1|t1],[h2|t2]) do
        cond do
            h1 != h2 -> empieza_con([h1|t1],t2)
            h1 == h2 -> empieza_con(t1,t2)
        end
    end
    #38. Escriba una función que tome como entrada tres listas y determine si la tercera se puede formar a
    #partir de los elementos de las dos primeras.
    def is_lineal_combination(_,_,[]), do: true
    def is_lineal_combination(l1,l2,[h3|t3]) do
        cond do
        pertenece(h3,l1) or pertenece(h3,l2) -> is_lineal_combination(l1,l2,t3)
        true -> false
        end
    end
end
defmodule Nivel4 do
    #39. Escriba una función llamada "Cantidad-de" que toma como argumentos una lista y una condición (función),
    #y  devuelve la cantidad de elementos de la lista que cumplen con dicha condición.
    def cantidad_de([],_condicion), do: 0
    def cantidad_de([h|t],condicion) do
        cond do
            condicion.(h) -> 1 + cantidad_de(t,condicion)
            true -> cantidad_de(t,condicion)
        end
    end
    #40. Defina una función que tome una lista de números y una condición (función) como parámetros y devuelva
    #la sumatoria de los elementos que cumplen dicha condición.
    def sumatoria_de([],_condicion), do: 0
    def sumatoria_de([h|t],condicion) do
        cond do
            condicion.(h) -> h + sumatoria_de(t,condicion)
            true -> sumatoria_de(t,condicion)
        end
    end
    #41. Defina una función llamada “Select” que devuelva la lista de elementos que cumplen con una determinada
    #condición.
    def select([],_condicion), do: []
    def select([h|t],condicion) do
        cond do
            condicion.(h) -> [h|select(t,condicion)]
            true -> select(t,condicion)
        end
    end
    #42. Defina una función llamada “Map” o “Collect” que devuelva la lista de los resultados de aplicar una
    #función que se pasa como parámetro a cada elemento de la lista de entrada.
    def map([],_f), do: []
    def map([h|t],f), do: [f.(h)|map(t,f)]
    #43. Escriba una función llamada “intercalar-según” que tome dos listas y una función como entrada, y
    #construya una nueva lista resultado de intercalar las dos primeras en el orden establecido por la función
    #(es decir, que la función se aplica a los dos elementos que se comparan en cada momento para determinar cuál es el mayor).
    def intercalar_segun([],[],_f), do: []
    def intercalar_segun([],l2,_f), do: l2
    def intercalar_segun(l1,[],_f), do: l1
    def intercalar_segun([h1|t1],[h2|t2],f) do
        cond do
            f.(h1) > f.(h2)-> [h1,h2|intercalar_segun(t1,t2,f)]
            f.(h1) < f.(h2)-> [h2,h1|intercalar_segun(t1,t2,f)]
            true -> [h1,h2|intercalar_segun(t1,t2,f)]
        end
    end
end
IO.inspect(Nivel4.intercalar_segun([1,2,3,4,5,6], fn x-> rem(x,2) end))
