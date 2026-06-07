#-------------------------------Nivel1-----------------------------------
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
#-------------------------------Nivel2-----------------------------------
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
IO.inspect(Nivel2.ejercicio_18([1,2,3,4,5]))
