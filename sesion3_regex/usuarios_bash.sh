#!/bin/bash
expresion='bash$'
while read -r linea; do 

if [[ $linea =~ $expresion ]];
    then
        echo "$linea"
    else
        echo "ningun usuario coincide con esa expresion"    
fi        

done < /etc/passwd