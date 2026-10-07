#!/bin/bash

re_longitud='^.{12,30}$'
re_digito='.*[0-9].*'
re_mayuscula='.*[A-Z].*'
re_caracter='.*[\!\?\%\;\:\ª\*\_\-]+.*'


if [[ $# -gt 0 ]]; 
    then
        if [[ $1 =~ $re_longitud && $1 =~ $re_digito && $1 =~ $re_mayuscula && $1 =~ $re_caracter ]]; 
            then
                if  grep -q "^$1$" /usr/share/dict/spanish; 
                    then
                        echo "La palabra existe en el diccionario, no es válida"
                    else
                        echo "La contraseña es válida"
                fi
        else
        echo "La contraseña no cumple el formato"
        fi
else
    echo "No se ha recibido el parametro"        
fi
