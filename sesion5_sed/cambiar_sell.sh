#!/bin/bash

ARCHIVO="passwd"

if [[ $# -ne 2 ]]; then
    echo "Uso: $0 <usuario> <shell>"
    exit 1
fi # si no hay dos parametros da error

USUARIO="$1"
NUEVA_SHELL="$2"

SHELL_VALIDA='^/bin/(bash|sh|zsh)$' #
if [[ ! $NUEVA_SHELL =~ $SHELL_VALIDA ]]; then
    echo "la shell debe ser /bin/bash, /bin/sh o /bin/zsh"
    exit 1
fi

if ! grep -q "^$USUARIO:" "$ARCHIVO"; then
    echo "el usuario $USUARIO no existe"
    exit 1
fi  ## si no encuentra el user en el passwd da error

cp "$ARCHIVO" "${ARCHIVO}.bak"

sed -i -E "s/^($USUARIO(:[^:]*){5}):.*$/\1:$NUEVA_SHELL/" "$ARCHIVO"
grep "^$USUARIO:" "$ARCHIVO"

