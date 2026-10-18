#!/bin/bash

parametro_valido='^[0-9]{1,3}$'

if [[ $# -eq 1 ]]; then

    if [[ $1 =~ $parametro_valido ]]; then
        cp login.defs login.defs.bak

        echo "Valor anterior:"
        grep '^PASS_MAX_DAYS' login.defs

       ## sed -i -E "s/^(PASS_MAX_DAYS[[:space:]]+)[0-9]+/\1$1/" login.defs

        echo  "Nuevo valor:"
        grep '^PASS_MAX_DAYS' login.defs
    else
        echo "El parámetro debe ser un numero valido de 1 a 3 digitos."
        exit 1
    fi

else
    echo " Debes pasar exactamente un argumento."
    exit 1
fi