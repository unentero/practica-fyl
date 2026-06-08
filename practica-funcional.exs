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

end
IO.inspect(Nivel3.suma_binaria_definitiva([1,0,1,0],[0,1,0,1]))
