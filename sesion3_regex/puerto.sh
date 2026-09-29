#!/bin/bash

expresion='^[0-9][0-9]*$'

if [[ $# -eq 0 ]]; 
    then
        echo "No se ha recibido el párametro"
    else
        if [[ $1 =~ $expresion ]];
            then  
                if [[ $1 -ge 1 && $1 -le 65535 ]];
                    then
                        echo "Es un puerto valido"
                    else
                        echo "No es un puerto valido"
                fi 
                        
        else
                echo "Expresion no valida"
        fi            
fi        