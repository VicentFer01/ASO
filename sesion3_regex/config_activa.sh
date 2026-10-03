#!/bin/bash

expresion='^[^#]'
counter=0

if [[ -f "$1" ]]; then

    while read -r linea; do

        if [[ $linea =~ $expresion ]]; then
            echo "$linea"
            ((counter++))
        fi

    done < "$1"

else
    echo " el archivo '$1' no existe."

fi

echo "Líneas: $counter"

