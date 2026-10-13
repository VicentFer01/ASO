#!/bin/bash

parametro_valido='^[0-9]{1,3}$'

if [[ $# -ne 1 ]];
    then
        if [[ $1 =~ $parametro_valido ]];
            then
                cp login.defs login.defs.bak

                cat login.defs | grep ^PASS_MAX_DAYS

                sed -E 's/PASS_MAX_DAYS/PASS_MAX_DAYS/\$1'
        fi

        else
            echo "El parametro no es valido"        
fi 
