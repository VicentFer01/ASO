#!/bin/bash
re_baja=^baja$
re_alta=^alta$

re_nombre='^[A-Za-z]+$'
re_apellidos='^[A-Za-z]+ [A-Za-z]+$'



if [[ $# -ne 2 ]];
    then
        echo "Se necesitan dos parametros"
        exit 1
fi

if [[ $1 =~ $re_alta ]];
    then
        read -p "Nombre: " nombre;
        read -p "Apellidos: " apellidos;

        if [[ ! $nombre =~ $re_nombre || ! $apellidos =~ $re_apellidos ]];
            then
                echo "El nombre no es valido";
                exit 1
        fi

        echo "Nombre valido"
        

fi
        
