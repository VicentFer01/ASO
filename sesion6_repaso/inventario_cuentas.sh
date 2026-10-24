#!/bin/bash

shell_default="/bin/bash"
shell=""
re='^(/[a-z]/)+'
total_cuentas=0
uid_mayores_1000=0



if [[ $# -eq 0 ]];
    then
        echo "Parametros no introducidos, shell será " $shell_default;
        shell=$shell_default
fi

if [[ $# -eq 1 ]];
    then
        if [[ $1 =~ $re ]];
            then
                shell=$1
                echo "La shell es valida, es " $1;
        fi

        if [[ ! $1 =~ $re ]];
            then
                echo "La shell es invalida";
                exit 1
        fi
fi

while IFS=: read -r usuario x uid gid desc home current_shell; do
    if [[ "$current_shell" == "$shell" ]]; then
        echo "$usuario:$uid:$home:$current_shell"
        ((total_cuentas++))
        
        if [ "$uid" -ge 1000 ]; then
            ((uid_mayores_1000++))
        fi
    fi
done < /etc/passwd  

echo "- Total de cuentas listadas: $total_cuentas"
echo "- Cuentas con UID >= 1000:   $uid_mayores_1000"



