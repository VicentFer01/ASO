#!/bin/bash

exp='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'

if [[ $# -eq 0 ]];
    then
        echo "no has introducido el parametro"
    else 
        if [[ $1 =~ $exp ]];
            then
                echo "El formato es valido"
            else 
                echo "El formato no es valido"
        fi
fi                
