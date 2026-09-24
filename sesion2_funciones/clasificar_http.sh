#!/bin/bash


clasificar_http() {
    read -p "Ingrese un código de estado HTTP: " codigo

    case $codigo in
    2[00-99])
        echo "Codigo de error: Exito"
        ;;
    3[00-99])
        echo"Codigo de error: Redirección
        ::
    4[00-99])
        echo "Codigo de error: Error del cliente"
        ;;       
    
    
}
    