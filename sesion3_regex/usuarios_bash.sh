#!/bin/bash
expresion='bash$'
while read -r linea; do 

if [[ $linea =~ $expresion ]];
    then
        echo "$linea"
fi        

done < /etc/passwd