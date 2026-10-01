#!/bin/bash

expresion='^[^#]'

counter=0

if [[ -f $1 ]];
    then
        while read linea; do
            if [[ $linea =~ $expresion  ]];
                then
                    echo "$linea"
                    ((counter++))
            fi
        done
fi          

echo "Líneas: $counter"



