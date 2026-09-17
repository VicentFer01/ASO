#!/bin/bash

nombre=$1

if [ -n  "$nombre" ]; then
    echo "Iniciando el servicio $nombre"
else
    echo "Debes indicar el nombre del servicio"
fi
