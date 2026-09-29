#!/bin/bash


clasificar_http() {
    read -p "Ingrese un código de estado HTTP: " codigo

    case $codigo in
    2[0-9][0-9])
        echo "Codigo de error: Exito"
        ;;
    3[0-9][0-9])
        echo "Codigo de error: Redirección"
        ;;
    4[0-9][0-9])
        echo "Codigo de error: Error del cliente"
        ;;     
    5[0-9][0-9])
        echo "Codigo de error: Error del servidor"
        ;;    
    *)
        echo "Codigo de error: Código no reconocido"
        ;;
    esac
}

clasificar_http
    