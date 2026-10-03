#!/bin/bash

re='^[a-z0-9._-]*@edu\.gva\.es'

if [[ $# -eq 0 ]];
    then
        echo "no has introducido el parametro"
    else 
        if [[ $1 =~ $re ]];
            then
                echo "El formato es de profesor"
            else 
                echo "El formato es de alumno"
        fi
fi            