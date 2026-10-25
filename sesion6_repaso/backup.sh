#!/bin/bash

re_copias='^[0-9]+$'

if [[ $# -ne 2 && $# -ne 0 ]];
    then
        echo "Numero de parametros no valido";
        exit 1
fi


if [[ $# -eq 2 ]];
    then
        directorio_destino=$1
        copias=$2

        if [[ ! -d $directorio_destino ]];
            then
                echo "Ese directorio no existe";
                exit 1
        fi

        if [[ ! $copias =~ $re_copias ]];
            then
                echo "Ese numero de copias no es valido"
                exit 1
        fi
fi

if [[ $# -eq 0 ]];
    then
        directorio_destino="/var/backups"
        copias=7
        echo "Directorio destino: $directorio_destino ";
        echo "Copias: $copias";
fi

tar -czvf etc-$(date +%Y%m%d-%H%M%S).tar.gz /var/backups

copias_total=$(ls $directorio_destino | grep -c .*\.tar\.gz$)

if [[ $copias_total -gt 7 ]];
    then
        echo "Aviso ya hay mas de 7 copias"
fi




