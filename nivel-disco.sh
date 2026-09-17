#!/bin/bash

bytes_usados=$1
bytes_totales=$2

if [[ -n "$bytes_usados" && -n "$bytes_totales" ]]; then

    porcentaje_usado=$((bytes_usados * 100 / bytes_totales))

    if [[ $porcentaje_usado -lt 70 ]]; then
        echo "OK"
    elif [[ $porcentaje_usado -ge 70 && $porcentaje_usado -lt 90 ]]; then
        echo "Aviso"
    elif [[ $porcentaje_usado -ge 90 ]]; then
        echo "Critico"
    fi

else
    echo "Parametros no recibidos"
fi
