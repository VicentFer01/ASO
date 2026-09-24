#!/bin/bash

read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

mostrar_menu() {
    echo "CALCULADORA"
    echo "1. Suma"
    echo "2. Resta"
    echo "3. Multiplicación"
    echo "4. División"
    echo "0. Salir"
}

sumar() {
    echo $((num1 + num2))
}

restar() {
    echo $((num1 - num2))
}

multiplicar() {
    echo $((num1 * num2))
}

dividir() {
    if [ "$num2" -eq 0 ]; then
        echo "Error: no se puede dividir entre cero."
    else
        echo $((num1 / num2))
    fi
}

mostrar_opcion() {
        read -p "Escribe la opción: " opcion

    case $opcion in
        1)
            echo "Resultado: $(sumar)"
            ;;
        2)
            echo "Resultado: $(restar)"
            ;;
        3)
            echo "Resultado: $(multiplicar)"
            ;;
        4)
            echo "Resultado: $(dividir)"
            ;;
        0)
            echo "Saliendo..."
            ;;
        *)
            echo "Opción no válida"
            ;;
    esac
}

while [ "$opcion" != "0" ]; do
    mostrar_menu
    mostrar_opcion
done    

#!