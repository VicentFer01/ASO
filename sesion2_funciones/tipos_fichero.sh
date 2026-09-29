#!/bin/bash

contar_por_extension() {
    read -p "Ingresa la ruta de la carpeta: " ruta
    read -p "Ingresa la extension del archivo: " extension

    ls -l "$ruta" | grep ".$extension"
    
}

contar_por_extension    