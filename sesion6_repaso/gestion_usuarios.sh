#!/bin/bash
re_baja=^baja$
re_alta=^alta$

re_nombre='^[A-Za-z]+$'
re_apellidos='^[A-Za-z]+ [A-Za-z]+$'

reIdvalid='^alu[a-z]{5}$'



if [[ $# -ne 2 ]];
    then
        echo "Se necesitan dos parametros"
        exit 1
fi

if [[ ! $1 =~ $re_alta && ! $1 =~ $re_baja ]];
    then
        echo "Solo existe la opción alta o baja";
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

        xx="${nombre:0:3}"
        yy="${apellidos:0:2}"
        id="alu${xx}${yy}"

        if grep -q "$id" /etc/passwd;
            then
                echo "El user $id ya existe en el sistema"
                exit 1
        fi
        
        sudo adduser $id
        echo "user con id $id creado";
        
fi

if [[ $1 =~ $re_baja ]];
    then
        if [[ ! $2 =~ $reIdvalid ]];
            then
                echo "El ID introducido no es valido";
                exit 1
        fi

        if grep -q ^$2 /etc/passwd;
            then
                userdel "$2"
                echo "User borrado del sistema";
        else
            echo "Ese user no existe en el sistema";
    
fi